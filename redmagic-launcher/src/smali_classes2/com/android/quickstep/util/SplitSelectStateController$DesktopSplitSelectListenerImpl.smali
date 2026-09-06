.class Lcom/android/quickstep/util/SplitSelectStateController$DesktopSplitSelectListenerImpl;
.super Lcom/android/wm/shell/splitscreen/c$a;
.source "SplitSelectStateController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/SplitSelectStateController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DesktopSplitSelectListenerImpl"
.end annotation


# instance fields
.field private mController:Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;


# direct methods
.method constructor <init>(Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/wm/shell/splitscreen/c$a;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/SplitSelectStateController$DesktopSplitSelectListenerImpl;->mController:Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;

    .line 5
    .line 6
    return-void
.end method

.method private synthetic lambda$onRequestSplitSelect$0(Landroid/app/ActivityManager$RunningTaskInfo;ILandroid/graphics/Rect;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/SplitSelectStateController$DesktopSplitSelectListenerImpl;->mController:Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;->enterSplitSelect(Landroid/app/ActivityManager$RunningTaskInfo;ILandroid/graphics/Rect;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic o2(Lcom/android/quickstep/util/SplitSelectStateController$DesktopSplitSelectListenerImpl;Landroid/app/ActivityManager$RunningTaskInfo;ILandroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/util/SplitSelectStateController$DesktopSplitSelectListenerImpl;->lambda$onRequestSplitSelect$0(Landroid/app/ActivityManager$RunningTaskInfo;ILandroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onRequestSplitSelect(Landroid/app/ActivityManager$RunningTaskInfo;ILandroid/graphics/Rect;)Z
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/util/T0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2, p3}, Lcom/android/quickstep/util/T0;-><init>(Lcom/android/quickstep/util/SplitSelectStateController$DesktopSplitSelectListenerImpl;Landroid/app/ActivityManager$RunningTaskInfo;ILandroid/graphics/Rect;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0
.end method

.method release()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/android/quickstep/util/SplitSelectStateController$DesktopSplitSelectListenerImpl;->mController:Lcom/android/quickstep/util/SplitSelectStateController$SplitFromDesktopController;

    .line 3
    .line 4
    return-void
.end method
