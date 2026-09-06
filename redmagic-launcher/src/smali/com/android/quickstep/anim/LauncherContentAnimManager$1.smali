.class Lcom/android/quickstep/anim/LauncherContentAnimManager$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "LauncherContentAnimManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/anim/LauncherContentAnimManager;->startHideDragLayerOnGestureStart()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/anim/LauncherContentAnimManager;


# direct methods
.method constructor <init>(Lcom/android/quickstep/anim/LauncherContentAnimManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager$1;->this$0:Lcom/android/quickstep/anim/LauncherContentAnimManager;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    const-string v0, "p0"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager$1;->this$0:Lcom/android/quickstep/anim/LauncherContentAnimManager;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-static {p0, p1}, Lcom/android/quickstep/anim/LauncherContentAnimManager;->b(Lcom/android/quickstep/anim/LauncherContentAnimManager;Landroid/animation/ObjectAnimator;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
