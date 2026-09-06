.class Lcom/android/launcher3/CellLayout$d;
.super Ljava/lang/Object;
.source "CellLayout.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/CellLayout;->g(Landroid/view/View;IIIIZZ)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:F

.field final synthetic h:F

.field final synthetic i:Landroid/view/View;

.field final synthetic j:I

.field final synthetic k:I

.field final synthetic l:Lcom/android/launcher3/CellLayout;


# direct methods
.method constructor <init>(Lcom/android/launcher3/CellLayout;FFLandroid/view/View;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/CellLayout$d;->l:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/CellLayout$d;->g:F

    .line 4
    .line 5
    iput p3, p0, Lcom/android/launcher3/CellLayout$d;->h:F

    .line 6
    .line 7
    iput-object p4, p0, Lcom/android/launcher3/CellLayout$d;->i:Landroid/view/View;

    .line 8
    .line 9
    iput p5, p0, Lcom/android/launcher3/CellLayout$d;->j:I

    .line 10
    .line 11
    iput p6, p0, Lcom/android/launcher3/CellLayout$d;->k:I

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    invoke-static {}, Lx1/O;->C3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_5

    .line 6
    .line 7
    iget v0, p0, Lcom/android/launcher3/CellLayout$d;->g:F

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    cmpl-float v2, v0, v1

    .line 11
    .line 12
    if-lez v2, :cond_0

    .line 13
    .line 14
    iget v2, p0, Lcom/android/launcher3/CellLayout$d;->h:F

    .line 15
    .line 16
    cmpl-float v1, v2, v1

    .line 17
    .line 18
    if-lez v1, :cond_0

    .line 19
    .line 20
    iget-object v1, p0, Lcom/android/launcher3/CellLayout$d;->i:Landroid/view/View;

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Landroid/view/View;->setScaleX(F)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/CellLayout$d;->i:Landroid/view/View;

    .line 26
    .line 27
    iget v1, p0, Lcom/android/launcher3/CellLayout$d;->g:F

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/CellLayout$d;->l:Lcom/android/launcher3/CellLayout;

    .line 33
    .line 34
    instance-of v1, v0, Lcom/android/launcher3/Hotseat;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    move-object v1, v0

    .line 39
    check-cast v1, Lcom/android/launcher3/Hotseat;

    .line 40
    .line 41
    iget v1, p0, Lcom/android/launcher3/CellLayout$d;->j:I

    .line 42
    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    check-cast v0, Lcom/android/launcher3/Hotseat;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/android/launcher3/Hotseat;->k1()V

    .line 48
    .line 49
    .line 50
    :cond_1
    iget v0, p0, Lcom/android/launcher3/CellLayout$d;->k:I

    .line 51
    .line 52
    if-eqz v0, :cond_2

    .line 53
    .line 54
    iget-object v0, p0, Lcom/android/launcher3/CellLayout$d;->l:Lcom/android/launcher3/CellLayout;

    .line 55
    .line 56
    check-cast v0, Lcom/android/launcher3/Hotseat;

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/android/launcher3/Hotseat;->j1()V

    .line 59
    .line 60
    .line 61
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/CellLayout$d;->l:Lcom/android/launcher3/CellLayout;

    .line 62
    .line 63
    instance-of v1, v0, Lcom/android/launcher3/Hotseat;

    .line 64
    .line 65
    if-nez v1, :cond_3

    .line 66
    .line 67
    instance-of v0, v0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 68
    .line 69
    if-eqz v0, :cond_5

    .line 70
    .line 71
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/CellLayout$d;->i:Landroid/view/View;

    .line 72
    .line 73
    const v1, 0x7f0b04c4

    .line 74
    .line 75
    .line 76
    const/4 v2, 0x0

    .line 77
    invoke-virtual {v0, v1, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/android/launcher3/CellLayout$d;->i:Landroid/view/View;

    .line 81
    .line 82
    const v1, 0x7f0b04c3

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v1, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/android/launcher3/CellLayout$d;->i:Landroid/view/View;

    .line 89
    .line 90
    const v1, 0x7f0b04c8

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0, v1, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    iget-object p0, p0, Lcom/android/launcher3/CellLayout$d;->l:Lcom/android/launcher3/CellLayout;

    .line 97
    .line 98
    iget-object p0, p0, Lcom/android/launcher3/CellLayout;->g:Lcom/android/launcher3/views/k;

    .line 99
    .line 100
    invoke-static {p0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    if-eqz p0, :cond_5

    .line 109
    .line 110
    const v0, 0x7f0b04be

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0, v0, v2}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    const v0, 0x7f0b04c2

    .line 117
    .line 118
    .line 119
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    instance-of v1, v1, Ljava/lang/Boolean;

    .line 124
    .line 125
    if-eqz v1, :cond_4

    .line 126
    .line 127
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 128
    .line 129
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 130
    .line 131
    .line 132
    :cond_4
    invoke-static {p0}, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;->X0(Lcom/android/launcher3/Hotseat;)V

    .line 133
    .line 134
    .line 135
    :cond_5
    return-void
.end method
