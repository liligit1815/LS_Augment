.class public Lcom/android/launcher3/popup/PopupContainerWithArrow$d;
.super Ljava/lang/Object;
.source "PopupContainerWithArrow.java"

# interfaces
.implements Lcom/android/launcher3/popup/PopupContainerWithArrow$f;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/popup/PopupContainerWithArrow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# instance fields
.field protected final g:Landroid/graphics/Point;

.field private final h:Lcom/android/launcher3/C2;

.field private final i:Lcom/android/launcher3/popup/PopupContainerWithArrow;


# direct methods
.method constructor <init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/popup/PopupContainerWithArrow;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Point;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$d;->g:Landroid/graphics/Point;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$d;->h:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    iput-object p2, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$d;->i:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$d;->h:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/touch/A;->d(Lcom/android/launcher3/C2;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    instance-of v0, v0, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    return v1

    .line 20
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    check-cast p1, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 25
    .line 26
    invoke-static {}, Lx1/O;->p0()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v2, 0x1

    .line 31
    if-eqz v0, :cond_4

    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$d;->i:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 44
    .line 45
    new-instance v3, Lcom/android/launcher3/popup/PopupContainerWithArrow$e;

    .line 46
    .line 47
    iget v0, v0, Lcom/android/launcher3/model/data/y;->id:I

    .line 48
    .line 49
    int-to-long v4, v0

    .line 50
    invoke-virtual {p1}, Lcom/android/launcher3/shortcuts/DeepShortcutView;->getFinalInfo()Lcom/android/launcher3/model/data/I;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v0, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 55
    .line 56
    invoke-direct {v3, v4, v5, v0}, Lcom/android/launcher3/popup/PopupContainerWithArrow$e;-><init>(JLjava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    sget-object v0, Lcom/android/launcher3/popup/PopupContainerWithArrow;->s:Ljava/util/HashMap;

    .line 60
    .line 61
    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Ljava/lang/Integer;

    .line 66
    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    goto :goto_0

    .line 74
    :cond_2
    move v0, v1

    .line 75
    :goto_0
    if-lez v0, :cond_3

    .line 76
    .line 77
    return v1

    .line 78
    :cond_3
    sget-object v4, Lcom/android/launcher3/popup/PopupContainerWithArrow;->s:Ljava/util/HashMap;

    .line 79
    .line 80
    add-int/2addr v0, v2

    .line 81
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v4, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    :cond_4
    invoke-virtual {p1, v1}, Lcom/android/launcher3/shortcuts/DeepShortcutView;->setWillDrawIcon(Z)V

    .line 89
    .line 90
    .line 91
    new-instance v0, Landroid/graphics/Point;

    .line 92
    .line 93
    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 94
    .line 95
    .line 96
    iget-object v3, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$d;->g:Landroid/graphics/Point;

    .line 97
    .line 98
    iget v3, v3, Landroid/graphics/Point;->x:I

    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/android/launcher3/shortcuts/DeepShortcutView;->getIconCenter()Landroid/graphics/Point;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    iget v4, v4, Landroid/graphics/Point;->x:I

    .line 105
    .line 106
    sub-int/2addr v3, v4

    .line 107
    iput v3, v0, Landroid/graphics/Point;->x:I

    .line 108
    .line 109
    iget-object v3, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$d;->g:Landroid/graphics/Point;

    .line 110
    .line 111
    iget v3, v3, Landroid/graphics/Point;->y:I

    .line 112
    .line 113
    iget-object v4, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$d;->h:Lcom/android/launcher3/C2;

    .line 114
    .line 115
    invoke-virtual {v4}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    iget v4, v4, Lcom/android/launcher3/h0;->B1:I

    .line 120
    .line 121
    sub-int/2addr v3, v4

    .line 122
    iput v3, v0, Landroid/graphics/Point;->y:I

    .line 123
    .line 124
    invoke-static {v1}, Lcom/android/launcher3/dragndrop/y;->h(I)Lcom/android/launcher3/dragndrop/y;

    .line 125
    .line 126
    .line 127
    move-result-object v6

    .line 128
    invoke-virtual {p1}, Lcom/android/launcher3/shortcuts/DeepShortcutView;->getFinalInfo()Lcom/android/launcher3/model/data/I;

    .line 129
    .line 130
    .line 131
    move-result-object v8

    .line 132
    const/16 v3, -0x6b

    .line 133
    .line 134
    iput v3, v8, Lcom/android/launcher3/model/data/y;->container:I

    .line 135
    .line 136
    iget-object v3, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$d;->h:Lcom/android/launcher3/C2;

    .line 137
    .line 138
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 139
    .line 140
    .line 141
    move-result-object v4

    .line 142
    invoke-virtual {p1}, Lcom/android/launcher3/shortcuts/DeepShortcutView;->getIconView()Landroid/view/View;

    .line 143
    .line 144
    .line 145
    move-result-object v5

    .line 146
    iget-object v7, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$d;->i:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 147
    .line 148
    new-instance v9, LN1/d;

    .line 149
    .line 150
    invoke-virtual {p1}, Lcom/android/launcher3/shortcuts/DeepShortcutView;->getIconView()Landroid/view/View;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    invoke-direct {v9, p1, v0}, LN1/d;-><init>(Landroid/view/View;Landroid/graphics/Point;)V

    .line 155
    .line 156
    .line 157
    new-instance v10, Lcom/android/launcher3/dragndrop/p;

    .line 158
    .line 159
    invoke-direct {v10}, Lcom/android/launcher3/dragndrop/p;-><init>()V

    .line 160
    .line 161
    .line 162
    invoke-virtual/range {v4 .. v10}, Lcom/android/launcher3/Workspace;->E0(Landroid/view/View;Lcom/android/launcher3/dragndrop/y;Lcom/android/launcher3/m0;Lcom/android/launcher3/model/data/y;Ln1/d;Lcom/android/launcher3/dragndrop/p;)Lcom/android/launcher3/dragndrop/v;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    if-eqz p1, :cond_6

    .line 167
    .line 168
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 169
    .line 170
    .line 171
    move-result-object v3

    .line 172
    invoke-virtual {v3}, Lcom/android/launcher3/resource/B;->p()Z

    .line 173
    .line 174
    .line 175
    move-result v3

    .line 176
    if-eqz v3, :cond_5

    .line 177
    .line 178
    goto :goto_1

    .line 179
    :cond_5
    iget v3, v0, Landroid/graphics/Point;->x:I

    .line 180
    .line 181
    neg-int v3, v3

    .line 182
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 183
    .line 184
    neg-int v0, v0

    .line 185
    invoke-virtual {p1, v3, v0}, Lcom/android/launcher3/dragndrop/v;->l(II)V

    .line 186
    .line 187
    .line 188
    iget-object p0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$d;->h:Lcom/android/launcher3/C2;

    .line 189
    .line 190
    invoke-static {p0, v2}, Lcom/android/launcher3/a;->closeOpenContainer(Lcom/android/launcher3/views/k;I)V

    .line 191
    .line 192
    .line 193
    :cond_6
    :goto_1
    return v1
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    if-eq p1, v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$d;->g:Landroid/graphics/Point;

    .line 12
    .line 13
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    float-to-int p1, p1

    .line 18
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    float-to-int p2, p2

    .line 23
    invoke-virtual {p0, p1, p2}, Landroid/graphics/Point;->set(II)V

    .line 24
    .line 25
    .line 26
    :goto_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method
