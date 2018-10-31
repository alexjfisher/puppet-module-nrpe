function nrpe::ssl_logging(
  Boolean $ssl_log_startup_params,
  Boolean $ssl_log_remote_ip,
  Boolean $ssl_log_protocol_version,
  Boolean $ssl_log_cipher,
  Boolean $ssl_log_client_cert,
  Boolean $ssl_log_client_cert_details,
) >> String {
  $result = {
    1  => $ssl_log_startup_params,
    2  => $ssl_log_remote_ip,
    4  => $ssl_log_protocol_version,
    8  => $ssl_log_cipher,
    16 => $ssl_log_client_cert,
    32 => $ssl_log_client_cert_details,
  }.reduce(0) |$memo, $value| {
    if $value[1] {
      $memo + $value[0]
    } else {
      $memo
    }
  }
  sprintf('0x%02x', $result)
}
