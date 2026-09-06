.class Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$4;
.super Ljava/lang/Object;
.source "LauncherSwipeHandlerV2.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->setAnimation(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$floatingIconView3:Lcom/android/launcher3/views/FloatingIconView;

.field final synthetic val$r72:Ljava/util/function/Consumer;


# direct methods
.method constructor <init>(Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;Lcom/android/launcher3/views/FloatingIconView;Ljava/util/function/Consumer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$4;->val$floatingIconView3:Lcom/android/launcher3/views/FloatingIconView;

    .line 2
    .line 3
    iput-object p3, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$4;->val$r72:Ljava/util/function/Consumer;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$4;->val$floatingIconView3:Lcom/android/launcher3/views/FloatingIconView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$4;->val$r72:Ljava/util/function/Consumer;

    .line 4
    .line 5
    invoke-static {v0, p0, p1, p2}, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->setAnimation$lambda$11$lambda$9(Lcom/android/launcher3/views/J;Ljava/util/function/Consumer;Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
