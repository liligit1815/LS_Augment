.class public Lcom/android/launcher3/DeleteDropTarget;
.super Lcom/android/launcher3/ButtonDropTarget;
.source "DeleteDropTarget.java"


# instance fields
.field private final G:Lcom/android/launcher3/logging/StatsLogManager;

.field private H:Lcom/android/launcher3/logging/StatsLogManager$e;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/DeleteDropTarget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/ButtonDropTarget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    invoke-static {p1}, Lcom/android/launcher3/logging/StatsLogManager;->newInstance(Landroid/content/Context;)Lcom/android/launcher3/logging/StatsLogManager;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/DeleteDropTarget;->G:Lcom/android/launcher3/logging/StatsLogManager;

    return-void
.end method

.method private E(Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    iget p0, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 2
    .line 3
    const/4 p1, -0x1

    .line 4
    if-eq p0, p1, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method private setControlTypeBasedOnDragSource(Lcom/android/launcher3/model/data/y;)V
    .locals 1

    .line 1
    iget p1, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    if-eq p1, v0, :cond_0

    .line 5
    .line 6
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->E:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->F:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 10
    .line 11
    :goto_0
    iput-object p1, p0, Lcom/android/launcher3/DeleteDropTarget;->H:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 12
    .line 13
    return-void
.end method

.method private setTextBasedOnDragSource(Lcom/android/launcher3/model/data/y;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->p:Ljava/lang/CharSequence;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-direct {p0, p1}, Lcom/android/launcher3/DeleteDropTarget;->E(Lcom/android/launcher3/model/data/y;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    const p1, 0x7f14008f

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/high16 p1, 0x1040000

    .line 24
    .line 25
    :goto_0
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->p:Ljava/lang/CharSequence;

    .line 30
    .line 31
    const p1, 0x7f080afc

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->setDrawable(I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/android/launcher3/ButtonDropTarget;->m()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    invoke-virtual {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->C(Z)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->p:Ljava/lang/CharSequence;

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/widget/TextView;->requestLayout()V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method


# virtual methods
.method public F(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/ButtonDropTarget;->F(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 5
    .line 6
    invoke-direct {p0, p2}, Lcom/android/launcher3/DeleteDropTarget;->setTextBasedOnDragSource(Lcom/android/launcher3/model/data/y;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 10
    .line 11
    invoke-direct {p0, p1}, Lcom/android/launcher3/DeleteDropTarget;->setControlTypeBasedOnDragSource(Lcom/android/launcher3/model/data/y;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public getAccessibilityAction()I
    .locals 0

    .line 1
    const p0, 0x7f0b0061

    .line 2
    .line 3
    .line 4
    return p0
.end method

.method public bridge synthetic getDropView()Landroid/view/View;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/n0;->getDropView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public h(Lcom/android/launcher3/n0$a;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/launcher3/DeleteDropTarget;->E(Lcom/android/launcher3/model/data/y;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_6

    .line 8
    .line 9
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->i:Lcom/android/launcher3/m0;

    .line 10
    .line 11
    instance-of v1, p1, Lcom/android/launcher3/Workspace;

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    instance-of p1, p1, Lcom/android/launcher3/folder/Folder;

    .line 16
    .line 17
    if-eqz p1, :cond_6

    .line 18
    .line 19
    :cond_0
    instance-of p1, v0, Lcom/android/launcher3/model/data/I;

    .line 20
    .line 21
    if-eqz p1, :cond_3

    .line 22
    .line 23
    move-object p1, v0

    .line 24
    check-cast p1, Lcom/android/launcher3/model/data/I;

    .line 25
    .line 26
    iget v1, p1, Lcom/android/launcher3/model/data/I;->m:I

    .line 27
    .line 28
    const/4 v2, 0x2

    .line 29
    if-ne v1, v2, :cond_3

    .line 30
    .line 31
    iget-object v1, p1, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    iget-object v1, p1, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 40
    .line 41
    invoke-virtual {v1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    goto :goto_0

    .line 50
    :cond_1
    iget-object v1, p1, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 51
    .line 52
    invoke-virtual {v1}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    :goto_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-nez v2, :cond_2

    .line 61
    .line 62
    new-instance v2, Lcom/android/launcher3/X0;

    .line 63
    .line 64
    iget-object v3, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 65
    .line 66
    invoke-direct {v2, v3}, Lcom/android/launcher3/X0;-><init>(Landroid/content/Context;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2, v1, p1}, Lcom/android/launcher3/X0;->s(Ljava/lang/String;Lcom/android/launcher3/model/data/I;)V

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_2
    const-string p1, "DeleteDropTarget"

    .line 74
    .line 75
    const-string v1, "packageName is null!"

    .line 76
    .line 77
    invoke-static {p1, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    :cond_3
    :goto_1
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 81
    .line 82
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->W1()Lcom/android/launcher3/folder/Folder;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    if-eqz p1, :cond_4

    .line 87
    .line 88
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 89
    .line 90
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->W1()Lcom/android/launcher3/folder/Folder;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p1}, Lcom/android/launcher3/a;->isOpen()Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-eqz v1, :cond_4

    .line 99
    .line 100
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->R1()V

    .line 101
    .line 102
    .line 103
    :cond_4
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 104
    .line 105
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-virtual {p1}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 110
    .line 111
    .line 112
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 113
    .line 114
    iget v1, v0, Lcom/android/launcher3/model/data/y;->container:I

    .line 115
    .line 116
    iget v2, v0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 117
    .line 118
    invoke-virtual {p1, v1, v2}, Lcom/android/launcher3/C2;->L1(II)Lcom/android/launcher3/CellLayout;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    if-eqz p1, :cond_5

    .line 123
    .line 124
    iget v1, v0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 125
    .line 126
    iget v2, v0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 127
    .line 128
    invoke-virtual {p1, v1, v2}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    if-eqz v1, :cond_5

    .line 133
    .line 134
    iget v1, v0, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 135
    .line 136
    iget v2, v0, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 137
    .line 138
    invoke-virtual {p1, v1, v2}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 139
    .line 140
    .line 141
    :cond_5
    iget-object p0, p0, Lcom/android/launcher3/ButtonDropTarget;->h:Lcom/android/launcher3/q0;

    .line 142
    .line 143
    invoke-virtual {p0, v0}, Lcom/android/launcher3/q0;->f(Lcom/android/launcher3/model/data/y;)V

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :cond_6
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->p:Ljava/lang/CharSequence;

    .line 148
    .line 149
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    const v1, 0x7f140343

    .line 154
    .line 155
    .line 156
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    if-ne p1, p0, :cond_7

    .line 161
    .line 162
    new-instance p0, Ljava/lang/StringBuilder;

    .line 163
    .line 164
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 165
    .line 166
    .line 167
    const-string p1, "If the drop target text is \'remove\', then users should always be able to delete the item from launcher\'s db. Invalid drag ItemInfo: "

    .line 168
    .line 169
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    const-string p1, "b/379606516"

    .line 180
    .line 181
    invoke-static {p1, p0}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    .line 183
    .line 184
    :cond_7
    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/ButtonDropTarget;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7f080afc

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/android/launcher3/ButtonDropTarget;->setDrawable(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/android/launcher3/ButtonDropTarget;->m()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p0, v0}, Lcom/android/launcher3/ButtonDropTarget;->C(Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public q(Landroid/view/View;Lcom/android/launcher3/model/data/y;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f14021a

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object p0, p0, Lcom/android/launcher3/ButtonDropTarget;->h:Lcom/android/launcher3/q0;

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2, v0}, Lcom/android/launcher3/q0;->d(Landroid/view/View;Lcom/android/launcher3/model/data/y;Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method protected setupItemInfo(Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    return-void
.end method

.method public x(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p2, p1, Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/android/launcher3/DeleteDropTarget;->E(Lcom/android/launcher3/model/data/y;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    instance-of p0, p1, Lcom/android/launcher3/model/data/A;

    .line 11
    .line 12
    if-nez p0, :cond_2

    .line 13
    .line 14
    instance-of p0, p1, Lcom/android/launcher3/model/data/m;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    return p0

    .line 21
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 22
    return p0
.end method

.method protected y(Lcom/android/launcher3/model/data/y;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->q()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-nez v0, :cond_7

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget-object v2, Lcom/android/launcher3/q4$a;->l:Lcom/android/launcher3/q4$a;

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_7

    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 29
    .line 30
    sget-object v2, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 31
    .line 32
    invoke-interface {v0, v2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_7

    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 39
    .line 40
    sget-object v2, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 41
    .line 42
    invoke-interface {v0, v2}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_7

    .line 47
    .line 48
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    sget-object v2, Lcom/android/launcher3/q4$a;->h:Lcom/android/launcher3/q4$a;

    .line 55
    .line 56
    invoke-virtual {v0, v2}, Lcom/android/launcher3/menu/c;->q(Lcom/android/launcher3/q4$a;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_0

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 64
    .line 65
    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->l0:Z

    .line 74
    .line 75
    if-eqz v0, :cond_1

    .line 76
    .line 77
    instance-of v0, p1, Lcom/android/launcher3/model/data/A;

    .line 78
    .line 79
    if-eqz v0, :cond_1

    .line 80
    .line 81
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-virtual {v0, v2}, Lcom/android/launcher3/H5;->B0(Landroid/content/ComponentName;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_1

    .line 94
    .line 95
    return v1

    .line 96
    :cond_1
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->M0()Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_6

    .line 113
    .line 114
    instance-of v0, p1, Lcom/android/launcher3/model/data/p;

    .line 115
    .line 116
    if-eqz v0, :cond_2

    .line 117
    .line 118
    return v1

    .line 119
    :cond_2
    instance-of v0, p1, Lcom/android/launcher3/model/data/I;

    .line 120
    .line 121
    if-eqz v0, :cond_6

    .line 122
    .line 123
    move-object v0, p1

    .line 124
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 125
    .line 126
    iget v2, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 127
    .line 128
    if-nez v2, :cond_3

    .line 129
    .line 130
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/I;->b0()Z

    .line 131
    .line 132
    .line 133
    move-result v2

    .line 134
    if-nez v2, :cond_3

    .line 135
    .line 136
    return v1

    .line 137
    :cond_3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->n(Lcom/android/launcher3/model/data/y;)Z

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    if-eqz v2, :cond_4

    .line 142
    .line 143
    return v1

    .line 144
    :cond_4
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    invoke-static {v2, p1}, Lcom/android/launcher3/popup/P;->isCanUnstallApp(Landroid/content/Context;Lcom/android/launcher3/model/data/y;)Z

    .line 149
    .line 150
    .line 151
    move-result v2

    .line 152
    if-eqz v2, :cond_5

    .line 153
    .line 154
    invoke-virtual {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->k(Lcom/android/launcher3/model/data/y;)Z

    .line 155
    .line 156
    .line 157
    move-result p0

    .line 158
    if-nez p0, :cond_6

    .line 159
    .line 160
    :cond_5
    iget p0, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 161
    .line 162
    const/4 p1, 0x6

    .line 163
    if-eq p0, p1, :cond_6

    .line 164
    .line 165
    return v1

    .line 166
    :cond_6
    const/4 p0, 0x1

    .line 167
    return p0

    .line 168
    :cond_7
    :goto_0
    return v1
.end method

.method public z(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/launcher3/DeleteDropTarget;->E(Lcom/android/launcher3/model/data/y;)Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 7
    .line 8
    instance-of v1, v0, Lcom/android/launcher3/model/data/A;

    .line 9
    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    check-cast v0, Lcom/android/launcher3/model/data/A;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Lf1/d;->j(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 27
    .line 28
    check-cast v0, Lcom/android/launcher3/model/data/A;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/android/launcher3/model/data/A;->h:Landroid/content/ComponentName;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v1, p1, Lcom/android/launcher3/n0$a;->g:Lcom/android/launcher3/model/data/y;

    .line 37
    .line 38
    iget-object v1, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 39
    .line 40
    if-nez v1, :cond_0

    .line 41
    .line 42
    iget-object v1, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 43
    .line 44
    const v2, 0x7f140155

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    goto :goto_0

    .line 52
    :cond_0
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    :goto_0
    invoke-static {v0, v1}, Lh1/a;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/ButtonDropTarget;->z(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V

    .line 60
    .line 61
    .line 62
    iget-object p2, p0, Lcom/android/launcher3/DeleteDropTarget;->G:Lcom/android/launcher3/logging/StatsLogManager;

    .line 63
    .line 64
    invoke-virtual {p2}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->n:Lcom/android/launcher3/logging/d;

    .line 69
    .line 70
    invoke-interface {p2, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object p0, p0, Lcom/android/launcher3/DeleteDropTarget;->H:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 75
    .line 76
    invoke-interface {p1, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method
