import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/widget/app_scaffold.dart';

@RoutePage()
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: context.lang.privacyPolicy,
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.s16),
        child: SingleChildScrollView(
          child: RichText(
            text: TextSpan(
              style: context.defaultStyle,
              children: [
                TextSpan(
                  text: '1. Thông tin chúng tôi thu thập\n',
                  style: context.defaultStyle.semiBold,
                ),
                const TextSpan(
                  text:
                      '- Thông tin đăng ký: tên, nickname, email.\n'
                      '- Thông tin tài khoản: mật khẩu (mã hóa), dữ liệu đăng nhập, ID thiết bị.\n'
                      '- Thông tin học tập: tiến trình học, bài học đã hoàn thành, điểm số, thời gian học.\n'
                      '- Thông tin tương tác: lịch sử sử dụng ứng dụng, phản hồi, câu hỏi.\n\n',
                ),
                TextSpan(
                  text: '2. Cách chúng tôi sử dụng thông tin\n',
                  style: context.defaultStyle.semiBold,
                ),
                const TextSpan(
                  text:
                      '- Cải thiện trải nghiệm học tập và đề xuất bài học phù hợp.\n'
                      '- Gửi thông báo quan trọng, nhắc nhở học tập (nếu đồng ý).\n'
                      '- Phân tích dữ liệu để nâng cao chất lượng ứng dụng.\n\n',
                ),
                TextSpan(
                  text: '3. Bảo mật thông tin\n',
                  style: context.defaultStyle.semiBold,
                ),
                const TextSpan(
                  text:
                      '- Thông tin được lưu trữ an toàn, sử dụng cơ chế mã hóa.\n'
                      '- Không bán hoặc cho thuê dữ liệu cá nhân.\n\n',
                ),
                TextSpan(
                  text: '4. Chia sẻ và tiết lộ thông tin\n',
                  style: context.defaultStyle.semiBold,
                ),
                const TextSpan(
                  text:
                      '- Tuân thủ theo yêu cầu pháp luật\n'
                      '- Bảo vệ quyền lợi hợp pháp của khách hàng.\n\n',
                ),
                TextSpan(
                  text: '5. Quyền của người dùng\n',
                  style: context.defaultStyle.semiBold,
                ),
                const TextSpan(
                  text:
                      '- Xem, chỉnh sửa, xóa thông tin cá nhân.\n'
                      '- Rút lại đồng ý sử dụng dữ liệu bất cứ lúc nào.\n'
                      '- Khi từ chối cung cấp dữ liệu, một số chức năng có thể bị hạn chế.\n\n',
                ),
                TextSpan(
                  text: '6. Lưu trữ và bảo vệ dữ liệu\n',
                  style: context.defaultStyle.semiBold,
                ),
                const TextSpan(
                  text: '- Dữ liệu lưu trữ theo yêu cầu pháp luật.\n\n',
                ),
                TextSpan(
                  text: '7. Thay đổi chính sách bảo mật\n',
                  style: context.defaultStyle.semiBold,
                ),
                const TextSpan(
                  text:
                      '- Chính sách có thể cập nhật để phù hợp luật pháp và cải thiện trải nghiệm.\n'
                      '- Thông báo thay đổi sẽ được hiển thị trong ứng dụng hoặc gửi email nếu có đăng ký.\n\n',
                ),
                TextSpan(
                  text: '8. Liên hệ\n',
                  style: context.defaultStyle.semiBold,
                ),
                const TextSpan(text: '- Email support@vietlite.com\n'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
