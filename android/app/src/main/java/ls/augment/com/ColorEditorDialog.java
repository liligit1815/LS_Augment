package ls.augment.com;

import android.app.Activity;
import android.app.Dialog;
import android.graphics.*;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.MotionEvent;
import android.view.View;
import android.widget.*;
import java.util.Locale;
import java.util.function.Consumer;

/** Shared HSV/ARGB editor using the app's dialog, typography and input components. */
final class ColorEditorDialog {
    private ColorEditorDialog() { }
    static Dialog show(Activity activity,UiKit ui,String title,String initial,Consumer<String> saved){
        LinearLayout content=new LinearLayout(activity);content.setOrientation(LinearLayout.VERTICAL);
        int first;try{first=Color.parseColor(initial);}catch(RuntimeException ignored){first=Color.WHITE;}
        final int[] argb={first};final boolean[] changing={false};final Dialog[] dialog={null};
        float[] hsv=new float[3];Color.colorToHSV(first,hsv);
        TextView sample=ui.text("颜色预览",14,ui.text,true);sample.setGravity(android.view.Gravity.CENTER);sample.setMinHeight(ui.dp(48));content.addView(sample,ui.wrap());
        EditText hex=new EditText(activity);ui.styleInput(hex);hex.setSingleLine(true);hex.setContentDescription("HEX颜色，#AARRGGBB或#RRGGBB");hex.setText(canonical(first));
        TextView error=ui.inlineInputError(hex,"shared-color-hex");
        TextView hueLabel=ui.text("色相",13,ui.muted,false),alphaLabel=ui.text("不透明度",13,ui.muted,false);
        SeekBar hue=new SeekBar(activity);hue.setMax(359);hue.setProgress(Math.round(hsv[0]));hue.setMinHeight(ui.dp(48));hue.setContentDescription("色相");
        SeekBar alpha=new SeekBar(activity);alpha.setMax(255);alpha.setProgress(Color.alpha(first));alpha.setMinHeight(ui.dp(48));alpha.setContentDescription("不透明度");
        for(SeekBar bar:new SeekBar[]{hue,alpha}){bar.setProgressTintList(android.content.res.ColorStateList.valueOf(ui.accent));bar.setThumbTintList(android.content.res.ColorStateList.valueOf(ui.accent));}
        SaturationValue palette=new SaturationValue(activity,ui,hsv);
        content.addView(palette,new LinearLayout.LayoutParams(-1,ui.dp(160)));
        content.addView(hueLabel,ui.margins(0,8,0,0));content.addView(hue,ui.wrap());content.addView(alphaLabel,ui.wrap());content.addView(alpha,ui.wrap());
        content.addView(ui.text("HEX：#AARRGGBB；6位RGB输入保留当前不透明度",12,ui.muted,false),ui.margins(0,8,0,8));content.addView(hex,ui.wrap());content.addView(error,ui.margins(0,4,0,0));
        Runnable render=()->{
            changing[0]=true;sample.setBackground(ui.roundStroke(argb[0],10,ui.outline,1));
            double brightness=(Color.red(argb[0])*299+Color.green(argb[0])*587+Color.blue(argb[0])*114)/1000.;sample.setTextColor(brightness>145?Color.BLACK:Color.WHITE);
            hue.setProgress(Math.round(hsv[0]));alpha.setProgress(Color.alpha(argb[0]));hueLabel.setText("色相："+Math.round(hsv[0])+"°");alphaLabel.setText("不透明度："+Math.round(Color.alpha(argb[0])*100f/255)+"%");
            String text=canonical(argb[0]);if(!text.contentEquals(hex.getText()))hex.setText(text);palette.invalidate();error.setText("");error.setVisibility(View.GONE);changing[0]=false;
        };
        Runnable hsvChanged=()->{argb[0]=Color.HSVToColor(alpha.getProgress(),hsv);render.run();};palette.changed=hsvChanged;
        hue.setOnSeekBarChangeListener(listener(progress->{if(changing[0])return;hsv[0]=progress;hsvChanged.run();}));
        alpha.setOnSeekBarChangeListener(listener(progress->{if(changing[0])return;argb[0]=(progress<<24)|(argb[0]&0x00FFFFFF);render.run();}));
        hex.addTextChangedListener(new TextWatcher(){public void beforeTextChanged(CharSequence s,int a,int c,int f){}public void afterTextChanged(Editable e){}public void onTextChanged(CharSequence text,int start,int before,int count){
            if(changing[0])return;String value=text.toString().trim();Integer parsed=parse(value,argb[0]);if(parsed==null){error.setText("请输入6位RGB或8位ARGB颜色");error.setVisibility(View.VISIBLE);return;}
            argb[0]=parsed;Color.colorToHSV(parsed,hsv);
            changing[0]=true;sample.setBackground(ui.roundStroke(parsed,10,ui.outline,1));hue.setProgress(Math.round(hsv[0]));alpha.setProgress(Color.alpha(parsed));hueLabel.setText("色相："+Math.round(hsv[0])+"°");alphaLabel.setText("不透明度："+Math.round(Color.alpha(parsed)*100f/255)+"%");palette.invalidate();error.setText("");error.setVisibility(View.GONE);changing[0]=false;
        }});
        render.run();dialog[0]=ui.glassDialog(title,content,"保存",null,"取消");
        Button confirm=dialog[0].findViewById(android.R.id.button1);
        View tagged=dialog[0].getWindow().getDecorView().findViewWithTag("glass-dialog-confirm");if(tagged instanceof Button)confirm=(Button)tagged;
        if(confirm!=null)confirm.setOnClickListener(v->{Integer parsed=parse(hex.getText().toString().trim(),argb[0]);if(parsed==null){error.setText("请输入6位RGB或8位ARGB颜色");error.setVisibility(View.VISIBLE);hex.requestFocus();return;}saved.accept(canonical(parsed));dialog[0].dismiss();});
        return dialog[0];
    }
    static Integer parse(String hex,int current){
        try{if(hex.matches("#[0-9A-Fa-f]{6}"))return (current&0xFF000000)|(int)Long.parseLong(hex.substring(1),16);
            if(hex.matches("#[0-9A-Fa-f]{8}"))return (int)Long.parseLong(hex.substring(1),16);return null;
        }catch(RuntimeException ignored){return null;}
    }
    private static String canonical(int color){return String.format(Locale.ROOT,"#%08X",color);}
    private static SeekBar.OnSeekBarChangeListener listener(java.util.function.IntConsumer changed){return new SeekBar.OnSeekBarChangeListener(){public void onStartTrackingTouch(SeekBar s){}public void onStopTrackingTouch(SeekBar s){}public void onProgressChanged(SeekBar s,int p,boolean user){if(user)changed.accept(p);}};}
    private static final class SaturationValue extends View {
        final float[] hsv;final UiKit ui;final Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);Runnable changed;
        SaturationValue(Activity activity,UiKit ui,float[] hsv){super(activity);this.ui=ui;this.hsv=hsv;setContentDescription("饱和度与明度色盘");setFocusable(true);setMinimumHeight(ui.dp(120));}
        @Override protected void onDraw(Canvas canvas){super.onDraw(canvas);float inset=ui.dp(6),width=getWidth()-inset*2,height=getHeight()-inset*2;
            RectF rect=new RectF(inset,inset,inset+width,inset+height);int hue=Color.HSVToColor(new float[]{hsv[0],1,1});
            paint.setShader(new ComposeShader(new LinearGradient(inset,inset,inset+width,inset,Color.WHITE,hue,Shader.TileMode.CLAMP),new LinearGradient(inset,inset,inset,inset+height,Color.WHITE,Color.BLACK,Shader.TileMode.CLAMP),PorterDuff.Mode.MULTIPLY));canvas.drawRoundRect(rect,ui.dp(8),ui.dp(8),paint);paint.setShader(null);
            float x=inset+hsv[1]*width,y=inset+(1-hsv[2])*height;paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(ui.dp(2));paint.setColor(Color.BLACK);canvas.drawCircle(x,y,ui.dp(7),paint);paint.setColor(Color.WHITE);canvas.drawCircle(x,y,ui.dp(5),paint);paint.setStyle(Paint.Style.FILL);
        }
        @Override public boolean onTouchEvent(MotionEvent e){switch(e.getActionMasked()){case MotionEvent.ACTION_DOWN:case MotionEvent.ACTION_MOVE:case MotionEvent.ACTION_UP:
            getParent().requestDisallowInterceptTouchEvent(true);float inset=ui.dp(6);hsv[1]=Math.max(0,Math.min(1,(e.getX()-inset)/Math.max(1,getWidth()-inset*2)));hsv[2]=1-Math.max(0,Math.min(1,(e.getY()-inset)/Math.max(1,getHeight()-inset*2)));if(changed!=null)changed.run();invalidate();if(e.getActionMasked()==MotionEvent.ACTION_UP){getParent().requestDisallowInterceptTouchEvent(false);performClick();}return true;
            case MotionEvent.ACTION_CANCEL:getParent().requestDisallowInterceptTouchEvent(false);return true;default:return super.onTouchEvent(e);}}
        @Override public boolean performClick(){super.performClick();return true;}
    }
}
