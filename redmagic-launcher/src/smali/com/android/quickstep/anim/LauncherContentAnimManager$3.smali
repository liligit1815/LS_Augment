.class Lcom/android/quickstep/anim/LauncherContentAnimManager$3;
.super Ljava/lang/Object;
.source "LauncherContentAnimManager.java"

# interfaces
.implements Ljava/util/function/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/quickstep/anim/LauncherContentAnimManager;->startLauncherContentAnim(Lcom/android/quickstep/util/animation/MultiAnimatorSet;ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/anim/LauncherContentAnimManager;

.field final synthetic val$isBackToAllApps:Z

.field final synthetic val$isDragLayerContentAnim:Z


# direct methods
.method constructor <init>(Lcom/android/quickstep/anim/LauncherContentAnimManager;ZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager$3;->this$0:Lcom/android/quickstep/anim/LauncherContentAnimManager;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager$3;->val$isDragLayerContentAnim:Z

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager$3;->val$isBackToAllApps:Z

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager$3;->this$0:Lcom/android/quickstep/anim/LauncherContentAnimManager;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager$3;->val$isDragLayerContentAnim:Z

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/android/quickstep/anim/LauncherContentAnimManager$3;->val$isBackToAllApps:Z

    .line 6
    .line 7
    check-cast p1, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-static {v0, v1, p0, p1}, Lcom/android/quickstep/anim/LauncherContentAnimManager;->startLauncherContentAnim$lambda$3(Lcom/android/quickstep/anim/LauncherContentAnimManager;ZZLjava/lang/Integer;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
