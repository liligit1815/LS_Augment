.class Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$b;
.super Ljava/lang/Object;
.source "SecondaryDragLayer.java"

# interfaces
.implements Lcom/android/launcher3/util/G2;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "b"
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;


# direct methods
.method private constructor <init>(Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$b;->g:Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;LJ1/s;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$b;-><init>(Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;)V

    return-void
.end method


# virtual methods
.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$b;->g:Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;->c(Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->h0()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$b;->g:Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;->d(Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;)Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/android/launcher3/a;->getTopOpenView(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/a;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    return v1

    .line 32
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_2

    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$b;->g:Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;

    .line 39
    .line 40
    invoke-static {v0}, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;->e(Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;)Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    check-cast v2, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 45
    .line 46
    invoke-virtual {v2}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v0, v2, p1}, Lcom/android/launcher3/views/BaseDragLayer;->isEventOverView(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-nez p1, :cond_2

    .line 55
    .line 56
    iget-object p0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer$b;->g:Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;

    .line 57
    .line 58
    invoke-static {p0}, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;->f(Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;)Landroid/content/Context;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    check-cast p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;

    .line 63
    .line 64
    invoke-virtual {p0, v1}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->k0(Z)V

    .line 65
    .line 66
    .line 67
    const/4 p0, 0x1

    .line 68
    return p0

    .line 69
    :cond_2
    return v1
.end method

.method public onControllerTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
