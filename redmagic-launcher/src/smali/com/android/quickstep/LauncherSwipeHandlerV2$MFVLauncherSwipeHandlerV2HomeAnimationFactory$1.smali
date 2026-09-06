.class Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$1;
.super Ljava/lang/Object;
.source "LauncherSwipeHandlerV2.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->tryReverseRecentAnim(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;Landroid/graphics/RectF;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;

.field final synthetic val$atomicBoolean:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final synthetic val$atomicBoolean2:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final synthetic val$objectRef:Lcom/android/launcher3/views/FloatingIconView;

.field final synthetic val$view:Landroid/view/View;

.field final synthetic val$z8:Z

.field final synthetic val$z9:Z


# direct methods
.method constructor <init>(Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/android/launcher3/views/FloatingIconView;Landroid/view/View;ZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$1;->this$1:Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$1;->val$atomicBoolean:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$1;->val$atomicBoolean2:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$1;->val$objectRef:Lcom/android/launcher3/views/FloatingIconView;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$1;->val$view:Landroid/view/View;

    .line 10
    .line 11
    iput-boolean p6, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$1;->val$z8:Z

    .line 12
    .line 13
    iput-boolean p7, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$1;->val$z9:Z

    .line 14
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$1;->val$atomicBoolean:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$1;->val$atomicBoolean2:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$1;->val$objectRef:Lcom/android/launcher3/views/FloatingIconView;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$1;->val$view:Landroid/view/View;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$1;->this$1:Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;

    .line 10
    .line 11
    iget-object v4, v4, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->this$0:Lcom/android/quickstep/AbsSwipeUpHandler;

    .line 12
    .line 13
    iget-boolean v5, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$1;->val$z8:Z

    .line 14
    .line 15
    iget-boolean v6, p0, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory$1;->val$z9:Z

    .line 16
    .line 17
    invoke-static/range {v0 .. v6}, Lcom/android/quickstep/LauncherSwipeHandlerV2$MFVLauncherSwipeHandlerV2HomeAnimationFactory;->tryReverseRecentAnim$lambda$13(Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/android/launcher3/views/FloatingIconView;Landroid/view/View;Lcom/android/quickstep/AbsSwipeUpHandler;ZZ)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
