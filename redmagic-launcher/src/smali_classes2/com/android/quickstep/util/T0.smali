.class public final synthetic Lcom/android/quickstep/util/T0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/util/SplitSelectStateController$DesktopSplitSelectListenerImpl;

.field public final synthetic h:Landroid/app/ActivityManager$RunningTaskInfo;

.field public final synthetic i:I

.field public final synthetic j:Landroid/graphics/Rect;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/util/SplitSelectStateController$DesktopSplitSelectListenerImpl;Landroid/app/ActivityManager$RunningTaskInfo;ILandroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/util/T0;->g:Lcom/android/quickstep/util/SplitSelectStateController$DesktopSplitSelectListenerImpl;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/util/T0;->h:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 7
    .line 8
    iput p3, p0, Lcom/android/quickstep/util/T0;->i:I

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/util/T0;->j:Landroid/graphics/Rect;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/T0;->g:Lcom/android/quickstep/util/SplitSelectStateController$DesktopSplitSelectListenerImpl;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/quickstep/util/T0;->h:Landroid/app/ActivityManager$RunningTaskInfo;

    .line 4
    .line 5
    iget v2, p0, Lcom/android/quickstep/util/T0;->i:I

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/quickstep/util/T0;->j:Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p0}, Lcom/android/quickstep/util/SplitSelectStateController$DesktopSplitSelectListenerImpl;->o2(Lcom/android/quickstep/util/SplitSelectStateController$DesktopSplitSelectListenerImpl;Landroid/app/ActivityManager$RunningTaskInfo;ILandroid/graphics/Rect;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
