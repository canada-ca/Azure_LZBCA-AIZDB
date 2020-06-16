# From f5_vm_onboard.tf
# Render new Onboard script (for debugging purposes)
resource "local_file" "LzPcADC-F5VM-vm_onboard_file" {
  content     = data.template_file.LzPcADC-F5VM-vm_onboard.rendered
  filename    = "${path.module}/files/LzPcADC-F5VM-vm_onboard.sh"
}

#############################################
# From f5_api_data.tf

# Render DO declaration
resource "local_file" "LzPcADC-F5VM01-do_json_file" {
  content     = data.template_file.LzPcADC-F5VM01-do_json.rendered
  filename    = "${path.module}/files/LzPcADC-F5VM01-do.json"
}

# Render DO declaration
resource "local_file" "LzPcADC-F5VM02-do_json_file" {
  content     = data.template_file.LzPcADC-F5VM02-do_json.rendered
  filename    = "${path.module}/files/LzPcADC-F5VM02-do.json"
}

# Render TS declaration
resource "local_file" "LzPcADC-F5VM01-ts_json_file" {
  content     = data.template_file.LzPcADC-F5VM01-ts_json.rendered
  filename    = "${path.module}/files/LzPcADC-F5VM01-ts.json"
}

# Render AS3 TS declaration
resource "local_file" "LzPcADC-F5VM01-as3_ts_json_file" {
  content     = data.template_file.LzPcADC-F5VM01-as3_ts_json.rendered
  filename    = "${path.module}/files/LzPcADC-F5VM01-as3_ts.json"
}