## Azure LZ Reporting Tool ##

# Connect to Azure
Connect-AzAccount

# Connect to Azure AD
Connect-AzureAD -AzureEnvironmentName "AzureCloud"


[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Windows.Forms.Application]::EnableVisualStyles()


## Button Functions...
function FunctionName
{
...
}

# Main Form Controls...
$Form                   = New-Object system.Windows.Forms.Form
$Form.Size              = New-Object System.Drawing.Size(1000,800)
$Form.BackColor         = "#ffffff"
$form.MaximizeBox       = $false
$Form.StartPosition     = "CenterScreen"
$Form.FormBorderStyle   = 'Fixed3D'
$Form.Text              = "Azure LZ Reporting Tool"
$Form.ForeColor         = "#33333"

# Images...
$iconBase64 = "<base64 encoded string>"

$iconBytes                  = [Convert]::FromBase64String($iconBase64)
$stream                     = New-Object IO.MemoryStream($iconBytes, 0, $iconBytes.Length)

$stream.Write($iconBytes, 0, $iconBytes.Length);

$iconImage                  = [System.Drawing.Image]::FromStream($stream, $true)
$Form.Icon                  = [System.Drawing.Icon]::FromHandle((New-Object System.Drawing.Bitmap -Argument $stream).GetHIcon())

$PictureBox1 = New-Object system.Windows.Forms.PictureBox

$PictureBox1.width          = 220
$PictureBox1.height         = 52
$PictureBox1.location       = New-Object System.Drawing.Point(6,10)
$PictureBox1.Image          = $iconImage
$PictureBox1.SizeMode       = [System.Windows.Forms.PictureBoxSizeMode]::zoom

$Form.controls.AddRange(@($PictureBox1))

# Label 1
$Label1                      = New-Object System.Windows.Forms.Label
$Label1.Text                 = "Select a command to run"
$Label1.AutoSize             = $true
$Label1.Location             = New-Object System.Drawing.Size(300,160)
$Label1.Font                 = 'Arial,15,style=Bold';

# Azure Icon
# Image in base64 format
$iconBase64 = "<base64 encoded string>"

$iconBytes      = [Convert]::FromBase64String($iconBase64)
$stream         = New-Object IO.MemoryStream($iconBytes, 0, $iconBytes.Length)

$stream.Write($iconBytes, 0, $iconBytes.Length);

$iconImage      = [System.Drawing.Image]::FromStream($stream, $true)
$Form.Icon      = [System.Drawing.Icon]::FromHandle((New-Object System.Drawing.Bitmap -Argument $stream).GetHIcon())
$form.Icon      = $iconImage


## Command Buttons...
$Button1                = New-Object System.Windows.Forms.Button
$Button1.Location       = New-Object System.Drawing.Size(80,200)
$Button1.Size           = New-Object System.Drawing.Size(300,50)
$Button1.BackColor      = "#2573b5"
$Button1.ForeColor      = "#ffffff"
$Button1.Text           = "Button Title"
$Font                   = New-Object System.Drawing.Font("Arial",12,[System.Drawing.FontStyle]::Regular)
$Button1.Font           = $Font

$Button1.Add_Click({GetSubs})
$Form.Controls.Add($Button1)

# Label 2
$Label2                  = New-Object System.Windows.Forms.Label
$Label2.Text             = "Select a report to run."
$Label2.AutoSize         = $true
$Label2.Location         = New-Object System.Drawing.Size(300,460)
$Label2.Font             = 'Arial,15,style=Bold';

$Form.Controls.Add($Label2)

# Label 3
$Label3                  = New-Object System.Windows.Forms.Label
$Label3.Text             = "Please be patient while the report is generating..."
$Label3.AutoSize         = $true
$Label3.Location         = New-Object System.Drawing.Size(240,490)
$Label3.Font             = 'Arial,13,style=Italic';
$Label3.ForeColor        = '#FF0000'

$Form.Controls.Add($Label3)


## Report Buttons

## Button Functions...
function GetQuotas
{
...
}

# Report Buttons
$Button7                = New-Object System.Windows.Forms.Button
$Button7.Location       = New-Object System.Drawing.Size(80,520)
$Button7.Size           = New-Object System.Drawing.Size(300,50)
$Button7.BackColor      = "#2573b5"
$Button7.ForeColor      = "#ffffff"
$Button7.Text           = "Button Title"
$Font                   = New-Object System.Drawing.Font("Arial",12,[System.Drawing.FontStyle]::Regular)
$Button7.Font           = $Font

$Button7.Add_Click({GetQuotas})
$Form.Controls.Add($Button7)


$Form.ShowDialog()


# Disconnect from Azure and Azure AD
Disconnect-AzAccount
Disconnect-AzureAD