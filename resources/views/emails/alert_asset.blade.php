<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Asset Alert Notification</title>
</head>
<body style="margin: 0; padding: 0; font-family: 'Georgia', 'Times New Roman', serif; background-color: #f8f9fa; color: #2c3e50;">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color: #f8f9fa;">
        <tr>
            <td align="center" style="padding: 60px 20px;">
                <table width="650" border="0" cellspacing="0" cellpadding="0" style="background-color: #ffffff; border-radius: 16px; overflow: hidden; box-shadow: 0 20px 40px rgba(0,0,0,0.1); border: 1px solid #e9ecef;">
                    <!-- Elegant Header -->
                    <tr>
                        <td style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); padding: 30px 40px; text-align: center; position: relative;">
                            <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="1" fill="%23ffffff" opacity="0.1"/><circle cx="75" cy="75" r="1" fill="%23ffffff" opacity="0.1"/><circle cx="50" cy="10" r="0.5" fill="%23ffffff" opacity="0.05"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>') repeat;"></div>
                            <h1 style="color: #ffffff; font-size: 36px; font-weight: 300; margin: 0; text-transform: uppercase; letter-spacing: 3px; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;">Asset Alert</h1>
                        </td>
                    </tr>
                    <!-- Content -->
                    <tr>
                        <td style="padding: 30px 50px; 20px 50px">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td style="color: #2c3e50; font-size: 20px; line-height: 1.8; text-align: center; margin-bottom: 40px; font-style: italic;">
                                        "An asset requires your immediate attention. Please review the following details with care."
                                    </td>
                                </tr>
                                <!-- Elegant Separator -->
                                <tr>
                                    <td style="text-align: center; padding: 30px 0;">
                                        <div style="width: 100px; height: 1px; background: linear-gradient(90deg, transparent, #667eea, transparent); margin: 0 auto;"></div>
                                    </td>
                                </tr>
                                <!-- Asset Details -->
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="20" style="border: 1px solid #e9ecef; border-radius: 12px; background-color: #fafbfc;">
                                            <tr>
                                                <td colspan="2" style="text-align: center; padding-bottom: 20px; border-bottom: 1px solid #e9ecef;">
                                                    <h2 style="color: #667eea; font-size: 24px; font-weight: 400; margin: 0; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;">Asset Information</h2>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight: 600; color: #495057; padding: 15px 20px; border-bottom: 1px solid #e9ecef; width: 35%; background-color: #f8f9fa;">Asset Name</td>
                                                <td style="color: #2c3e50; padding: 15px 20px; border-bottom: 1px solid #e9ecef;">{{ $data->field_name ?? '' }} <span style="color: #6c757d; font-size: 14px;">({{ $data->field_code ?? '' }})</span></td>
                                            </tr>
                                             <tr>
                                                <td style="font-weight: 600; color: #495057; padding: 15px 20px; border-bottom: 1px solid #e9ecef; background-color: #f8f9fa;">Location</td>
                                                <td style="color: #2c3e50; padding: 15px 20px; border-bottom: 1px solid #e9ecef;">{{ $data->has_asset->has_location->field_name ?? '' }}</td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight: 600; color: #495057; padding: 15px 20px; border-bottom: 1px solid #e9ecef; background-color: #f8f9fa;">Alert Date</td>
                                                <td style="color: #2c3e50; padding: 15px 20px; border-bottom: 1px solid #e9ecef;">{{ $data->field_waktu ?? '' }}</td>
                                            </tr>
                                            <tr>
                                                <td style="font-weight: 600; color: #495057; padding: 15px 20px; border-bottom: 1px solid #e9ecef; background-color: #f8f9fa;">Description</td>
                                                <td style="color: #2c3e50; padding: 15px 20px; border-bottom: 1px solid #e9ecef;">{{ $data->field_description ?? '' }}</td>
                                            </tr>

                                            <tr>
                                                <td style="font-weight: 600; color: #495057; padding: 15px 20px; background-color: #f8f9fa;">Frequency</td>
                                                <td style="color: #2c3e50; padding: 15px 20px;">{{ $data->field_banyak ?? '' }} {{ $data->field_setiap ?? '' }}</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <!-- Elegant Button -->
                                <tr>
                                    <td align="center" style="padding: 20px;">
                                        <table border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td style="border-radius: 30px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);">
                                                    <a href="{{ route('detail_asset', ['id' => $data->field_asset_id]) }}" style="display: inline-block; color: #ffffff; text-decoration: none; padding: 18px 40px; font-weight: 600; font-size: 16px; text-transform: uppercase; letter-spacing: 1px; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; border-radius: 30px;">
                                                        View Asset Details
                                                    </a>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <!-- Elegant Footer -->
                    <tr>
                        <td style="background-color: #f8f9fa; padding: 40px 50px; text-align: center; border-top: 1px solid #e9ecef;">
                            <div style="width: 100px; height: 1px; background: linear-gradient(90deg, transparent, #667eea, transparent); margin: 0 auto 20px;"></div>
                            <p style="color: #6c757d; font-size: 16px; margin: 0; font-style: italic;">
                                {{ env('APP_NAME') }}
                            </p>
                            <p style="color: #adb5bd; font-size: 14px; margin: 10px 0 0 0;">
                                <strong>{{ date('F j, Y') }}</strong>
                            </p>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>
