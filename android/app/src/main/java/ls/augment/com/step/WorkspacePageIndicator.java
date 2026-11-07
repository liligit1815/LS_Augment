package ls.augment.com.step;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.view.View;

/** Uses the existing deck/header gap, so controls keep their original touch bounds. */
final class WorkspacePageIndicator extends View {
    final WorkspaceQuickBar owner;
    final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);
    WorkspacePageIndicator(WorkspaceQuickBar owner){
        super(owner.ctx);this.owner=owner;
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
    }
    @Override protected void onDraw(Canvas canvas){
        WorkspaceDeck deck=owner.deck;
        int count=deck.getChildCount();if(count<2)return;
        float gap=owner.dp(9),radius=Math.min(owner.dp(2),getHeight()/2f);
        float left=(getWidth()-(count-1)*gap)/2f;
        paint.setColor(StepMaterial.ink(getContext()));
        for(int i=0;i<count;i++){
            float selected=Math.max(0f,1f-Math.abs(deck.offset-i));
            paint.setAlpha(Math.round(72+156*selected));
            canvas.drawCircle(left+i*gap,getHeight()/2f,radius,paint);
        }
    }
}
