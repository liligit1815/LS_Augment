.class Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$3;
.super Ljava/lang/Object;
.source "LauncherSwipeHandlerV2.java"

# interfaces
.implements Ljava/util/function/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->setAnimation(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;


# direct methods
.method constructor <init>(Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$3;->this$1:Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$3;->this$1:Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0$:Lcom/android/quickstep/LauncherSwipeHandlerV2;

    .line 4
    .line 5
    check-cast p1, Landroid/view/MotionEvent;

    .line 6
    .line 7
    invoke-static {p0, p1}, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->setAnimation$lambda$11$lambda$8(Lcom/android/quickstep/AbsSwipeUpHandler;Landroid/view/MotionEvent;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
