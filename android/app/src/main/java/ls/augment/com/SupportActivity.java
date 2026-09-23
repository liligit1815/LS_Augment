package ls.augment.com;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.TextPaint;
import android.text.method.LinkMovementMethod;
import android.text.style.URLSpan;
import android.view.Gravity;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

/** Local payment-code images supplied by the developer, shown without launching payments. */
public final class SupportActivity extends Activity {
    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        UiKit ui=new UiKit(this);
        LinearLayout page=ui.detailPage("支持",null);
        page.setPadding(ui.dp(14),ui.dp(8),ui.dp(14),ui.dp(24));
        TextView description=ui.text("",11.5f,ui.muted,false);
        description.setTag("support-description");
        String message="感谢您的支持！\n捐赠并不能为您带来特权，但能帮助我继续进行维护。\n您可以在此处联系到我。";
        SpannableString linked=new SpannableString(message);
        int start=message.indexOf("此处");
        linked.setSpan(new URLSpan("mailto:lililimailq@qq.com") {
            @Override public void onClick(View view) { openEmail(); }
            @Override public void updateDrawState(TextPaint paint) {
                paint.setColor(ui.accent);
                paint.setUnderlineText(true);
            }
        },start,start+2,Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        description.setText(linked);
        description.setMovementMethod(LinkMovementMethod.getInstance());
        description.setHighlightColor(ui.accentContainer);
        description.setLineSpacing(ui.dp(2),1f);
        page.addView(description,ui.margins(2,0,2,12));

        LinearLayout columns=new LinearLayout(this);
        columns.setTag("support-code-columns");
        columns.setOrientation(LinearLayout.HORIZONTAL);
        columns.setGravity(Gravity.TOP);
        columns.setBaselineAligned(false);
        // The wrapping row measures each card at its assigned width, then gives
        // both MATCH_PARENT cards the taller height without changing image ratios.
        LinearLayout.LayoutParams left=new LinearLayout.LayoutParams(0,-1,1);
        left.setMarginEnd(ui.dp(4));
        LinearLayout.LayoutParams right=new LinearLayout.LayoutParams(0,-1,1);
        right.setMarginStart(ui.dp(4));
        columns.addView(paymentCode(ui,"微信",R.drawable.support_wechat,"support-wechat-code"),left);
        columns.addView(paymentCode(ui,"支付宝",R.drawable.support_alipay,"support-alipay-code"),right);
        page.addView(columns,ui.wrap());
    }

    private LinearLayout paymentCode(UiKit ui,String label,int resource,String tag) {
        LinearLayout card=ui.card(); card.setGravity(Gravity.TOP|Gravity.CENTER_HORIZONTAL);
        card.setPadding(ui.dp(12),ui.dp(10),ui.dp(12),ui.dp(12));
        card.addView(ui.text(label,13,ui.text,true),ui.margins(0,0,0,8));
        ImageView code=new ImageView(this);
        code.setTag(tag); code.setImageResource(resource);
        code.setContentDescription(label+"收款码");
        code.setScaleType(ImageView.ScaleType.FIT_CENTER);
        code.setAdjustViewBounds(true);
        // The weighted column bounds the width even on narrow screens. Its height
        // follows the original image ratio, preserving the whole QR quiet zone.
        card.addView(code,new LinearLayout.LayoutParams(-1,-2));
        return card;
    }

    private void openEmail() {
        try {
            startActivity(new Intent(Intent.ACTION_SENDTO,Uri.parse("mailto:lililimailq@qq.com")));
        } catch(ActivityNotFoundException unavailable) {
            Toast.makeText(this,"未找到可打开邮件链接的应用",Toast.LENGTH_LONG).show();
        }
    }
}
