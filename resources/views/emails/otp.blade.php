<!DOCTYPE html>
<html>
    <body style="font-family: Arial, sans-serif; text-align: center;">
        <h2 style="color: #333;">Your OTP Code</h2>
        <p style="font-size: 16px; color: #555;">Your OTP code for password reset is:</p>
        <div style="font-size: 32px; font-weight: bold; color: #45db2e; margin: 20px 0;">
            <span id="otp-code" style="user-select: all;">{{ $otpCode }}</span>
        </div>
        <p style="font-size: 14px; color: #777;">It will expire in 10 minutes.</p>
        <p style="font-size: 12px; color: #888;">Please use the code above to reset your password.</p>
    </body>
</html>
