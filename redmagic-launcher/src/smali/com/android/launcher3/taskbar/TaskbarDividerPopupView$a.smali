.class public final Lcom/android/launcher3/taskbar/TaskbarDividerPopupView$a;
.super Ljava/lang/Object;
.source "TaskbarDividerPopupView.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView$a;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;Lcom/android/launcher3/taskbar/I1;F)Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Lcom/android/launcher3/taskbar/I1;",
            "F)",
            "Lcom/android/launcher3/taskbar/TaskbarDividerPopupView<",
            "*>;"
        }
    .end annotation

    .line 1
    const-string p0, "view"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "taskbarActivityContext"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/b;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/I1;->w0()Lcom/android/launcher3/taskbar/TaskbarDragLayer;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    const/4 v0, 0x0

    .line 20
    const v1, 0x7f0e022e

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p2, "null cannot be cast to non-null type com.android.launcher3.taskbar.TaskbarDividerPopupView<*>"

    .line 28
    .line 29
    invoke-static {p0, p2}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    check-cast p0, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;

    .line 33
    .line 34
    invoke-static {p0, p1, p3}, Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;->V(Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;Landroid/view/View;F)Lcom/android/launcher3/taskbar/TaskbarDividerPopupView;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method
