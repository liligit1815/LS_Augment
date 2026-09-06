.class public Lcom/android/launcher3/M5$b;
.super Lcom/android/launcher3/M5;
.source "TransitionEffect.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/M5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field private d:Lcom/android/launcher3/Workspace;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/V4;)V
    .locals 1

    .line 1
    const-string v0, "default"

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/M5;-><init>(Lcom/android/launcher3/V4;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    instance-of v0, p1, Lcom/android/launcher3/Workspace;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    check-cast p1, Lcom/android/launcher3/Workspace;

    .line 11
    .line 12
    iput-object p1, p0, Lcom/android/launcher3/M5$b;->d:Lcom/android/launcher3/Workspace;

    .line 13
    .line 14
    :cond_0
    return-void
.end method


# virtual methods
.method public d(Landroid/view/View;IF)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/android/launcher3/M5$b;->d:Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    iget-object p2, p2, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 6
    .line 7
    if-eqz p2, :cond_1

    .line 8
    .line 9
    sget-object v0, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 10
    .line 11
    invoke-interface {p2, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-eqz p2, :cond_1

    .line 16
    .line 17
    const/high16 p2, 0x3f800000    # 1.0f

    .line 18
    .line 19
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    sub-float/2addr p2, v0

    .line 24
    const/4 v0, 0x0

    .line 25
    cmpg-float p3, p3, v0

    .line 26
    .line 27
    if-gez p3, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 31
    .line 32
    .line 33
    move-result p3

    .line 34
    int-to-float v0, p3

    .line 35
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/View;->setPivotX(F)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 39
    .line 40
    .line 41
    move-result p3

    .line 42
    int-to-float p3, p3

    .line 43
    const/high16 v0, 0x3f000000    # 0.5f

    .line 44
    .line 45
    mul-float/2addr p3, v0

    .line 46
    invoke-virtual {p1, p3}, Landroid/view/View;->setPivotY(F)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/android/launcher3/M5;->a:Lcom/android/launcher3/V4;

    .line 50
    .line 51
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/V4;->setChildAlpha(Landroid/view/View;F)V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method
