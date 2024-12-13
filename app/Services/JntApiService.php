<?php
namespace App\Services;

use GuzzleHttp\Client;

class JntApiService
{
    protected $client;
    protected $apiKey;
    protected $sendSiteCode;
    protected $productType;
    protected $customerName;
    protected $tariffEndpoint;

    public function __construct(Client $client)
    {
        $this->client = $client;
        $this->apiKey = config('jnt.api_key');
        $this->sendSiteCode = config('jnt.send_site_code');
        $this->productType = config('jnt.product_type');
        $this->customerName = config('jnt.customer_name');
        $this->tariffEndpoint = config('jnt.tariff_endpoint');
    }

    public function checkTariff($weight, $destAreaCode)
    {
        // Membuat data untuk permintaan tarif
        $data = [
            'weight' => $weight,
            'sendSiteCode' => $this->sendSiteCode,
            'destAreaCode' => $destAreaCode,
            'cusName' => $this->customerName,
            'productType' => $this->productType,
        ];

        // Step 1: Encode data menjadi JSON
        $json = json_encode($data);

        // Step 2: Membuat parameter untuk signature (gunakan format yang sesuai)
        $data_param = "weight=$weight&sendSiteCode=$this->sendSiteCode&destAreaCode=$destAreaCode&cusName=$this->customerName&productType=$this->productType";

        // Step 3: Menghitung MD5 dan base64_encode signature
        $signature = base64_encode(md5($data_param . $this->apiKey));

        // Step 4: Menyiapkan data yang akan dikirim
        $dataToSend = [
            'data' => $json,
            'sign' => $signature,
        ];

        try {
            // Mengirimkan request POST ke API
            $response = $this->client->post($this->tariffEndpoint, [
                'form_params' => $dataToSend,  // Pastikan menggunakan 'form_params' untuk x-www-form-urlencoded
            ]);

            // Mendapatkan body dari response
            $responseBody = json_decode($response->getBody()->getContents(), true);
            return $responseBody;

        } catch (\Exception $e) {
            return ['error' => $e->getMessage()];
        }
    }
}
