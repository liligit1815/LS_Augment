.class Lcom/android/launcher3/Workspace$l;
.super Ljava/lang/Object;
.source "Workspace.java"

# interfaces
.implements Lcom/android/launcher3/L4;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/Workspace;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "l"
.end annotation


# instance fields
.field final g:[F

.field final h:I

.field final i:I

.field final j:I

.field final k:I

.field final l:Lcom/android/launcher3/n0$a;

.field final m:Landroid/view/View;

.field final synthetic n:Lcom/android/launcher3/Workspace;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/Workspace;[FIIIILcom/android/launcher3/n0$a;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/Workspace$l;->n:Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/Workspace$l;->g:[F

    .line 7
    .line 8
    iput p3, p0, Lcom/android/launcher3/Workspace$l;->h:I

    .line 9
    .line 10
    iput p4, p0, Lcom/android/launcher3/Workspace$l;->i:I

    .line 11
    .line 12
    iput p5, p0, Lcom/android/launcher3/Workspace$l;->j:I

    .line 13
    .line 14
    iput p6, p0, Lcom/android/launcher3/Workspace$l;->k:I

    .line 15
    .line 16
    iput-object p8, p0, Lcom/android/launcher3/Workspace$l;->m:Landroid/view/View;

    .line 17
    .line 18
    iput-object p7, p0, Lcom/android/launcher3/Workspace$l;->l:Lcom/android/launcher3/n0$a;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/c;)V
    .locals 14

    .line 1
    invoke-static {}, Lx1/O;->C3()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/launcher3/Workspace$l;->n:Lcom/android/launcher3/Workspace;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/android/launcher3/Workspace;->x:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const v0, 0x7f0b032d

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    instance-of v1, p1, Ljava/lang/Boolean;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    check-cast p1, Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    iget-object p1, p0, Lcom/android/launcher3/Workspace$l;->n:Lcom/android/launcher3/Workspace;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 37
    .line 38
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 39
    .line 40
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    const/4 p1, 0x2

    .line 44
    new-array v9, p1, [I

    .line 45
    .line 46
    iget-object v0, p0, Lcom/android/launcher3/Workspace$l;->n:Lcom/android/launcher3/Workspace;

    .line 47
    .line 48
    iget-object p1, v0, Lcom/android/launcher3/Workspace;->C:[F

    .line 49
    .line 50
    const/4 v11, 0x0

    .line 51
    aget v1, p1, v11

    .line 52
    .line 53
    float-to-int v1, v1

    .line 54
    const/4 v12, 0x1

    .line 55
    aget p1, p1, v12

    .line 56
    .line 57
    float-to-int v2, p1

    .line 58
    iget v3, p0, Lcom/android/launcher3/Workspace$l;->h:I

    .line 59
    .line 60
    iget v4, p0, Lcom/android/launcher3/Workspace$l;->i:I

    .line 61
    .line 62
    iget-object v5, v0, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 63
    .line 64
    iget-object v6, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 65
    .line 66
    invoke-virtual/range {v0 .. v6}, Lcom/android/launcher3/Workspace;->a1(IIIILcom/android/launcher3/CellLayout;[I)[I

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iput-object p1, v0, Lcom/android/launcher3/Workspace;->r:[I

    .line 71
    .line 72
    iget-object p1, p0, Lcom/android/launcher3/Workspace$l;->n:Lcom/android/launcher3/Workspace;

    .line 73
    .line 74
    iget-object v0, p1, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 75
    .line 76
    iget-object v1, p1, Lcom/android/launcher3/Workspace;->C:[F

    .line 77
    .line 78
    aget v2, v1, v11

    .line 79
    .line 80
    float-to-int v2, v2

    .line 81
    aget v1, v1, v12

    .line 82
    .line 83
    float-to-int v1, v1

    .line 84
    iget v3, p0, Lcom/android/launcher3/Workspace$l;->h:I

    .line 85
    .line 86
    iget v4, p0, Lcom/android/launcher3/Workspace$l;->i:I

    .line 87
    .line 88
    iget v5, p0, Lcom/android/launcher3/Workspace$l;->j:I

    .line 89
    .line 90
    iget v6, p0, Lcom/android/launcher3/Workspace$l;->k:I

    .line 91
    .line 92
    iget-object v7, p0, Lcom/android/launcher3/Workspace$l;->m:Landroid/view/View;

    .line 93
    .line 94
    iget-object v8, p1, Lcom/android/launcher3/Workspace;->r:[I

    .line 95
    .line 96
    const/4 v10, 0x1

    .line 97
    move v13, v2

    .line 98
    move v2, v1

    .line 99
    move v1, v13

    .line 100
    invoke-virtual/range {v0 .. v10}, Lcom/android/launcher3/CellLayout;->n0(IIIIIILandroid/view/View;[I[II)[I

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iput-object v0, p1, Lcom/android/launcher3/Workspace;->r:[I

    .line 105
    .line 106
    iget-object p1, p0, Lcom/android/launcher3/Workspace$l;->n:Lcom/android/launcher3/Workspace;

    .line 107
    .line 108
    iget-object v0, p1, Lcom/android/launcher3/Workspace;->r:[I

    .line 109
    .line 110
    aget v1, v0, v11

    .line 111
    .line 112
    if-ltz v1, :cond_2

    .line 113
    .line 114
    aget v0, v0, v12

    .line 115
    .line 116
    if-gez v0, :cond_1

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_1
    const/4 v0, 0x3

    .line 120
    invoke-virtual {p1, v0}, Lcom/android/launcher3/Workspace;->setDragMode(I)V

    .line 121
    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_2
    :goto_0
    iget-object p1, p1, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 125
    .line 126
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->x0()V

    .line 127
    .line 128
    .line 129
    :goto_1
    aget v3, v9, v11

    .line 130
    .line 131
    iget p1, p0, Lcom/android/launcher3/Workspace$l;->j:I

    .line 132
    .line 133
    if-ne v3, p1, :cond_4

    .line 134
    .line 135
    aget p1, v9, v12

    .line 136
    .line 137
    iget v0, p0, Lcom/android/launcher3/Workspace$l;->k:I

    .line 138
    .line 139
    if-eq p1, v0, :cond_3

    .line 140
    .line 141
    goto :goto_2

    .line 142
    :cond_3
    move v8, v11

    .line 143
    goto :goto_3

    .line 144
    :cond_4
    :goto_2
    move v8, v12

    .line 145
    :goto_3
    iget-object p1, p0, Lcom/android/launcher3/Workspace$l;->n:Lcom/android/launcher3/Workspace;

    .line 146
    .line 147
    iget-object v0, p1, Lcom/android/launcher3/Workspace;->u:Lcom/android/launcher3/CellLayout;

    .line 148
    .line 149
    iget-object v1, p1, Lcom/android/launcher3/Workspace;->r:[I

    .line 150
    .line 151
    aget v2, v1, v11

    .line 152
    .line 153
    aget v1, v1, v12

    .line 154
    .line 155
    aget v4, v9, v12

    .line 156
    .line 157
    iget-object v5, p0, Lcom/android/launcher3/Workspace$l;->l:Lcom/android/launcher3/n0$a;

    .line 158
    .line 159
    iget-object v6, v5, Lcom/android/launcher3/n0$a;->m:Lcom/android/launcher3/dragndrop/y;

    .line 160
    .line 161
    invoke-static {p1}, Lcom/android/launcher3/Workspace;->v0(Lcom/android/launcher3/Workspace;)Ln1/d;

    .line 162
    .line 163
    .line 164
    move-result-object v7

    .line 165
    move v13, v2

    .line 166
    move v2, v1

    .line 167
    move v1, v13

    .line 168
    invoke-virtual/range {v0 .. v8}, Lcom/android/launcher3/CellLayout;->F0(IIIILcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/y;Ln1/d;Z)V

    .line 169
    .line 170
    .line 171
    return-void
.end method
