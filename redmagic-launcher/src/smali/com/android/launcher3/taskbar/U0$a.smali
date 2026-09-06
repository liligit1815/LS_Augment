.class Lcom/android/launcher3/taskbar/U0$a;
.super Landroid/view/ViewOutlineProvider;
.source "StashedHandleViewController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/U0;->o(Lcom/android/launcher3/taskbar/R1;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Lcom/android/launcher3/taskbar/U0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/U0;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/U0$a;->b:Lcom/android/launcher3/taskbar/U0;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/taskbar/U0$a;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    div-int/lit8 v0, v0, 0x2

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget v2, p0, Lcom/android/launcher3/taskbar/U0$a;->a:I

    .line 12
    .line 13
    div-int/lit8 v2, v2, 0x2

    .line 14
    .line 15
    sub-int/2addr v1, v2

    .line 16
    iget-object v2, p0, Lcom/android/launcher3/taskbar/U0$a;->b:Lcom/android/launcher3/taskbar/U0;

    .line 17
    .line 18
    invoke-static {v2}, Lcom/android/launcher3/taskbar/U0;->d(Lcom/android/launcher3/taskbar/U0;)Landroid/graphics/Rect;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iget-object v3, p0, Lcom/android/launcher3/taskbar/U0$a;->b:Lcom/android/launcher3/taskbar/U0;

    .line 23
    .line 24
    invoke-static {v3}, Lcom/android/launcher3/taskbar/U0;->h(Lcom/android/launcher3/taskbar/U0;)I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    div-int/lit8 v3, v3, 0x2

    .line 29
    .line 30
    sub-int v3, v0, v3

    .line 31
    .line 32
    iget-object v4, p0, Lcom/android/launcher3/taskbar/U0$a;->b:Lcom/android/launcher3/taskbar/U0;

    .line 33
    .line 34
    invoke-static {v4}, Lcom/android/launcher3/taskbar/U0;->e(Lcom/android/launcher3/taskbar/U0;)I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    div-int/lit8 v4, v4, 0x2

    .line 39
    .line 40
    sub-int v4, v1, v4

    .line 41
    .line 42
    iget-object v5, p0, Lcom/android/launcher3/taskbar/U0$a;->b:Lcom/android/launcher3/taskbar/U0;

    .line 43
    .line 44
    invoke-static {v5}, Lcom/android/launcher3/taskbar/U0;->h(Lcom/android/launcher3/taskbar/U0;)I

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    div-int/lit8 v5, v5, 0x2

    .line 49
    .line 50
    add-int/2addr v0, v5

    .line 51
    iget-object v5, p0, Lcom/android/launcher3/taskbar/U0$a;->b:Lcom/android/launcher3/taskbar/U0;

    .line 52
    .line 53
    invoke-static {v5}, Lcom/android/launcher3/taskbar/U0;->e(Lcom/android/launcher3/taskbar/U0;)I

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    div-int/lit8 v5, v5, 0x2

    .line 58
    .line 59
    add-int/2addr v1, v5

    .line 60
    invoke-virtual {v2, v3, v4, v0, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/android/launcher3/taskbar/U0$a;->b:Lcom/android/launcher3/taskbar/U0;

    .line 64
    .line 65
    invoke-static {v0}, Lcom/android/launcher3/taskbar/U0;->g(Lcom/android/launcher3/taskbar/U0;)Lcom/android/launcher3/taskbar/StashedHandleView;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-object v1, p0, Lcom/android/launcher3/taskbar/U0$a;->b:Lcom/android/launcher3/taskbar/U0;

    .line 70
    .line 71
    invoke-static {v1}, Lcom/android/launcher3/taskbar/U0;->d(Lcom/android/launcher3/taskbar/U0;)Landroid/graphics/Rect;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/StashedHandleView;->d(Landroid/graphics/Rect;)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/android/launcher3/taskbar/U0$a;->b:Lcom/android/launcher3/taskbar/U0;

    .line 79
    .line 80
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    int-to-float p1, p1

    .line 85
    const/high16 v1, 0x40000000    # 2.0f

    .line 86
    .line 87
    div-float/2addr p1, v1

    .line 88
    invoke-static {v0, p1}, Lcom/android/launcher3/taskbar/U0;->j(Lcom/android/launcher3/taskbar/U0;F)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Lcom/android/launcher3/taskbar/U0$a;->b:Lcom/android/launcher3/taskbar/U0;

    .line 92
    .line 93
    invoke-static {p1}, Lcom/android/launcher3/taskbar/U0;->d(Lcom/android/launcher3/taskbar/U0;)Landroid/graphics/Rect;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iget-object p0, p0, Lcom/android/launcher3/taskbar/U0$a;->b:Lcom/android/launcher3/taskbar/U0;

    .line 98
    .line 99
    invoke-static {p0}, Lcom/android/launcher3/taskbar/U0;->f(Lcom/android/launcher3/taskbar/U0;)F

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    invoke-virtual {p2, p1, p0}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    .line 104
    .line 105
    .line 106
    return-void
.end method
