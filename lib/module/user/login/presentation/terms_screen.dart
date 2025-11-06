import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:vietlite/app/res/dimensions.dart';
import 'package:vietlite/common/extension/extension.dart';
import 'package:vietlite/widget/app_scaffold.dart';

@RoutePage()
class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: context.lang.terms,
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.s16),
        child: SingleChildScrollView(
          child: RichText(
            text: TextSpan(
              style: context.defaultStyle,
              children: [
                TextSpan(
                  text: '1. Chấp nhận điều khoản\n',
                  style: context.defaultStyle.semiBold,
                ),
                const TextSpan(
                  text:
                      '- Khi sử dụng ứng dụng, bạn đồng ý tuân thủ các điều khoản này.\n\n',
                ),
                TextSpan(
                  text: '2. Điều kiện sử dụng\n',
                  style: context.defaultStyle.semiBold,
                ),
                const TextSpan(
                  text:
                      '- Ứng dụng chỉ dành cho mục đích học tập cá nhân.\n'
                      '- Không được sao chép, phân phối, chỉnh sửa hoặc sử dụng nội dung trái phép.\n'
                      '- Không được sử dụng ứng dụng cho mục đích bất hợp pháp hoặc gây hại cho người khác.\n\n',
                ),
                TextSpan(
                  text: '3. Tài khoản và bảo mật\n',
                  style: context.defaultStyle.semiBold,
                ),
                const TextSpan(
                  text:
                      '- Người dùng cần cung cấp thông tin chính xác khi đăng ký.\n'
                      '- Mọi hoạt động trên tài khoản của bạn được coi là do bạn thực hiện.\n\n',
                ),
                TextSpan(
                  text: '4. Quyền sở hữu trí tuệ\n',
                  style: context.defaultStyle.semiBold,
                ),
                const TextSpan(
                  text:
                      '- Nội dung ứng dụng (bài học, hình ảnh, video, nhãn hiệu) thuộc quyền sở hữu của nhà phát triển.\n'
                      '- Không được phân phối, chỉnh sửa hoặc sử dụng nội dung ứng dụng cho mục đích thương mại mà không có sự đồng ý.\n\n',
                ),
                TextSpan(
                  text: '5. Hạn chế trách nhiệm\n',
                  style: context.defaultStyle.semiBold,
                ),
                const TextSpan(
                  text:
                      '- Ứng dụng không chịu trách nhiệm về thiệt hại trực tiếp, gián tiếp hoặc mất dữ liệu.\n'
                      '- Không đảm bảo ứng dụng luôn liên tục, không lỗi hoặc an toàn tuyệt đối.\n\n',
                ),
                TextSpan(
                  text: '6. Chấm dứt sử dụng\n',
                  style: context.defaultStyle.semiBold,
                ),
                const TextSpan(
                  text:
                      '- Nhà phát triển có quyền tạm ngừng hoặc chấm dứt quyền truy cập nếu vi phạm điều khoản.\n\n',
                ),
                TextSpan(
                  text: '7. Liên kết bên thứ ba\n',
                  style: context.defaultStyle.semiBold,
                ),
                const TextSpan(
                  text:
                      '- Ứng dụng có thể liên kết đến dịch vụ bên thứ ba.\n'
                      '- Chúng tôi không chịu trách nhiệm về nội dung hoặc chính sách bảo mật của các bên thứ ba.\n\n',
                ),
                TextSpan(
                  text: '8. Cập nhật điều khoản\n',
                  style: context.defaultStyle.semiBold,
                ),
                const TextSpan(
                  text:
                      '- Điều khoản có thể được cập nhật để phù hợp pháp luật và cải thiện trải nghiệm.\n'
                      '- Phiên bản mới sẽ được thông báo trong ứng dụng.\n\n',
                ),
                TextSpan(
                  text: '9. Giải quyết tranh chấp\n',
                  style: context.defaultStyle.semiBold,
                ),
                const TextSpan(
                  text:
                      '- Mọi tranh chấp sẽ được giải quyết theo pháp luật Việt Nam.\n\n',
                ),
                TextSpan(
                  text: '10. Liên hệ\n',
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
