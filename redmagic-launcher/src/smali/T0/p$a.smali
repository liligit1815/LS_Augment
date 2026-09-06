.class LT0/p$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "FolderAnimationManagerMFV.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LT0/p;->x0()Landroid/animation/AnimatorSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private g:Lcom/android/launcher3/CellLayout;

.field private h:Lcom/android/launcher3/K5;

.field private i:Z

.field private j:Z

.field private k:Z

.field private l:Z

.field private m:Z

.field private n:Z

.field private o:Z

.field private p:Z

.field private q:Z

.field private r:Z

.field final synthetic s:LT0/p;


# direct methods
.method constructor <init>(LT0/p;)V
    .locals 0

    .line 1
    iput-object p1, p0, LT0/p$a;->s:LT0/p;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 7

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, LT0/p$a;->s:LT0/p;

    .line 5
    .line 6
    invoke-static {p1}, LT0/p;->K(LT0/p;)Lcom/android/launcher3/folder/Folder;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-boolean v0, p0, LT0/p$a;->i:Z

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setClipChildren(Z)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, LT0/p$a;->s:LT0/p;

    .line 16
    .line 17
    invoke-static {p1}, LT0/p;->M(LT0/p;)Lcom/android/launcher3/folder/Folder;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-boolean v0, p0, LT0/p$a;->j:Z

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setClipToPadding(Z)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, LT0/p$a;->s:LT0/p;

    .line 27
    .line 28
    invoke-static {p1}, LT0/p;->N(LT0/p;)Lcom/android/launcher3/folder/FolderPagedView;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-boolean v0, p0, LT0/p$a;->k:Z

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, LT0/p$a;->s:LT0/p;

    .line 38
    .line 39
    invoke-static {p1}, LT0/p;->O(LT0/p;)Lcom/android/launcher3/folder/FolderPagedView;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget-boolean v0, p0, LT0/p$a;->l:Z

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, LT0/p$a;->g:Lcom/android/launcher3/CellLayout;

    .line 49
    .line 50
    if-eqz p1, :cond_0

    .line 51
    .line 52
    iget-boolean v0, p0, LT0/p$a;->m:Z

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, LT0/p$a;->g:Lcom/android/launcher3/CellLayout;

    .line 58
    .line 59
    iget-boolean v0, p0, LT0/p$a;->n:Z

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 62
    .line 63
    .line 64
    :cond_0
    iget-object p1, p0, LT0/p$a;->h:Lcom/android/launcher3/K5;

    .line 65
    .line 66
    if-eqz p1, :cond_1

    .line 67
    .line 68
    iget-boolean v0, p0, LT0/p$a;->o:Z

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, LT0/p$a;->h:Lcom/android/launcher3/K5;

    .line 74
    .line 75
    iget-boolean v0, p0, LT0/p$a;->p:Z

    .line 76
    .line 77
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 78
    .line 79
    .line 80
    :cond_1
    iget-object p1, p0, LT0/p$a;->s:LT0/p;

    .line 81
    .line 82
    invoke-static {p1}, LT0/p;->P(LT0/p;)Lcom/android/launcher3/folder/Folder;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getContentWrapper()Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    check-cast p1, Landroid/view/ViewGroup;

    .line 91
    .line 92
    iget-boolean v0, p0, LT0/p$a;->q:Z

    .line 93
    .line 94
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, LT0/p$a;->s:LT0/p;

    .line 98
    .line 99
    invoke-static {p1}, LT0/p;->Q(LT0/p;)Lcom/android/launcher3/folder/Folder;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getContentWrapper()Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    check-cast p1, Landroid/view/ViewGroup;

    .line 108
    .line 109
    iget-boolean v0, p0, LT0/p$a;->r:Z

    .line 110
    .line 111
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, LT0/p$a;->s:LT0/p;

    .line 115
    .line 116
    invoke-static {p1}, LT0/p;->R(LT0/p;)Lcom/android/launcher3/folder/Folder;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 121
    .line 122
    invoke-virtual {p1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    if-nez p1, :cond_2

    .line 127
    .line 128
    goto/16 :goto_2

    .line 129
    .line 130
    :cond_2
    new-instance v0, Ljava/util/ArrayList;

    .line 131
    .line 132
    iget-object v1, p0, LT0/p$a;->s:LT0/p;

    .line 133
    .line 134
    invoke-static {v1}, LT0/p;->S(LT0/p;)Lcom/android/launcher3/folder/FolderPagedView;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    const/4 v2, 0x0

    .line 139
    invoke-virtual {v1, v2}, Lcom/android/launcher3/folder/FolderPagedView;->g0(I)Ljava/util/List;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 144
    .line 145
    .line 146
    move v1, v2

    .line 147
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 148
    .line 149
    .line 150
    move-result v3

    .line 151
    if-ge v1, v3, :cond_7

    .line 152
    .line 153
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v3

    .line 157
    check-cast v3, Landroid/view/View;

    .line 158
    .line 159
    move-object v4, v3

    .line 160
    check-cast v4, Lcom/android/launcher3/BubbleTextView;

    .line 161
    .line 162
    iget-object v5, p0, LT0/p$a;->s:LT0/p;

    .line 163
    .line 164
    invoke-static {v5}, LT0/p;->T(LT0/p;)Lcom/android/launcher3/folder/Folder;

    .line 165
    .line 166
    .line 167
    move-result-object v5

    .line 168
    iget-object v5, v5, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 169
    .line 170
    invoke-interface {v5}, Lcom/android/launcher3/views/k;->getForeColor()I

    .line 171
    .line 172
    .line 173
    move-result v5

    .line 174
    const/4 v6, -0x1

    .line 175
    if-ne v6, v5, :cond_3

    .line 176
    .line 177
    const/4 v5, 0x1

    .line 178
    goto :goto_1

    .line 179
    :cond_3
    move v5, v2

    .line 180
    :goto_1
    invoke-static {v4, v5}, Lcom/android/launcher3/O6;->f(Landroid/widget/TextView;Z)V

    .line 181
    .line 182
    .line 183
    const/high16 v4, 0x3f800000    # 1.0f

    .line 184
    .line 185
    invoke-virtual {v3, v4}, Landroid/view/View;->setAlpha(F)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 189
    .line 190
    .line 191
    move-result-object v5

    .line 192
    invoke-virtual {v5}, Lcom/android/launcher3/q4;->a0()Z

    .line 193
    .line 194
    .line 195
    move-result v5

    .line 196
    if-eqz v5, :cond_4

    .line 197
    .line 198
    instance-of v5, v3, Lcom/android/launcher3/BubbleTextView;

    .line 199
    .line 200
    if-eqz v5, :cond_4

    .line 201
    .line 202
    move-object v5, v3

    .line 203
    check-cast v5, Lcom/android/launcher3/BubbleTextView;

    .line 204
    .line 205
    invoke-virtual {v5, v2}, Lcom/android/launcher3/BubbleTextView;->setShouldHideCheckbox(Z)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {v3}, Landroid/view/View;->invalidate()V

    .line 209
    .line 210
    .line 211
    :cond_4
    iget-object v5, p0, LT0/p$a;->s:LT0/p;

    .line 212
    .line 213
    invoke-static {v5}, LT0/p;->U(LT0/p;)Z

    .line 214
    .line 215
    .line 216
    move-result v5

    .line 217
    if-eqz v5, :cond_6

    .line 218
    .line 219
    instance-of v5, v3, Lcom/android/launcher3/BubbleTextView;

    .line 220
    .line 221
    if-eqz v5, :cond_6

    .line 222
    .line 223
    check-cast v3, Lcom/android/launcher3/BubbleTextView;

    .line 224
    .line 225
    iget-object v5, p0, LT0/p$a;->s:LT0/p;

    .line 226
    .line 227
    iget-object v5, v5, LT0/p;->r:LT0/p$g;

    .line 228
    .line 229
    invoke-virtual {v5}, LT0/p$g;->c()F

    .line 230
    .line 231
    .line 232
    move-result v5

    .line 233
    cmpl-float v4, v5, v4

    .line 234
    .line 235
    if-nez v4, :cond_6

    .line 236
    .line 237
    invoke-virtual {v3}, Lcom/android/launcher3/BubbleTextView;->f0()Z

    .line 238
    .line 239
    .line 240
    move-result v4

    .line 241
    if-eqz v4, :cond_5

    .line 242
    .line 243
    invoke-virtual {v3, v2}, Lcom/android/launcher3/BubbleTextView;->setForceHideDot(Z)V

    .line 244
    .line 245
    .line 246
    :cond_5
    invoke-virtual {v3}, Lcom/android/launcher3/BubbleTextView;->k0()Z

    .line 247
    .line 248
    .line 249
    move-result v4

    .line 250
    if-eqz v4, :cond_6

    .line 251
    .line 252
    invoke-virtual {v3, v2}, Lcom/android/launcher3/BubbleTextView;->setForceHideDownloadMark(Z)V

    .line 253
    .line 254
    .line 255
    :cond_6
    add-int/lit8 v1, v1, 0x1

    .line 256
    .line 257
    goto :goto_0

    .line 258
    :cond_7
    :goto_2
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;Z)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    invoke-super {p0, p1, p2}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;Z)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, LT0/p$a;->s:LT0/p;

    .line 7
    .line 8
    invoke-static {p1}, LT0/p;->z(LT0/p;)Lcom/android/launcher3/folder/FolderPagedView;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Lcom/android/launcher3/folder/FolderPagedView;->getCurrentCellLayout()Lcom/android/launcher3/CellLayout;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, LT0/p$a;->g:Lcom/android/launcher3/CellLayout;

    .line 17
    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    goto/16 :goto_2

    .line 21
    .line 22
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, LT0/p$a;->h:Lcom/android/launcher3/K5;

    .line 27
    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    goto/16 :goto_2

    .line 31
    .line 32
    :cond_1
    iget-object p1, p0, LT0/p$a;->s:LT0/p;

    .line 33
    .line 34
    invoke-static {p1}, LT0/p;->A(LT0/p;)Lcom/android/launcher3/folder/Folder;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getAlpha()F

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    const/high16 p2, 0x3f800000    # 1.0f

    .line 43
    .line 44
    invoke-static {p1, p2}, Ljava/lang/Float;->compare(FF)I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_2

    .line 49
    .line 50
    const-string p1, "FolderAnimationManagerMFV"

    .line 51
    .line 52
    const-string v2, "onAnimationStart: mFolder reset alpha !!"

    .line 53
    .line 54
    invoke-static {p1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, LT0/p$a;->s:LT0/p;

    .line 58
    .line 59
    invoke-static {p1}, LT0/p;->L(LT0/p;)Lcom/android/launcher3/folder/Folder;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->setAlpha(F)V

    .line 64
    .line 65
    .line 66
    :cond_2
    iget-object p1, p0, LT0/p$a;->s:LT0/p;

    .line 67
    .line 68
    invoke-static {p1}, LT0/p;->W(LT0/p;)Lcom/android/launcher3/folder/Folder;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getClipChildren()Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    iput-boolean p1, p0, LT0/p$a;->i:Z

    .line 77
    .line 78
    iget-object p1, p0, LT0/p$a;->s:LT0/p;

    .line 79
    .line 80
    invoke-static {p1}, LT0/p;->h0(LT0/p;)Lcom/android/launcher3/folder/Folder;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getClipToPadding()Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    iput-boolean p1, p0, LT0/p$a;->j:Z

    .line 89
    .line 90
    iget-object p1, p0, LT0/p$a;->s:LT0/p;

    .line 91
    .line 92
    invoke-static {p1}, LT0/p;->o0(LT0/p;)Lcom/android/launcher3/folder/FolderPagedView;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getClipChildren()Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    iput-boolean p1, p0, LT0/p$a;->k:Z

    .line 101
    .line 102
    iget-object p1, p0, LT0/p$a;->s:LT0/p;

    .line 103
    .line 104
    invoke-static {p1}, LT0/p;->p0(LT0/p;)Lcom/android/launcher3/folder/FolderPagedView;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getClipToPadding()Z

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    iput-boolean p1, p0, LT0/p$a;->l:Z

    .line 113
    .line 114
    iget-object p1, p0, LT0/p$a;->g:Lcom/android/launcher3/CellLayout;

    .line 115
    .line 116
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getClipChildren()Z

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    iput-boolean p1, p0, LT0/p$a;->m:Z

    .line 121
    .line 122
    iget-object p1, p0, LT0/p$a;->g:Lcom/android/launcher3/CellLayout;

    .line 123
    .line 124
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getClipToPadding()Z

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    iput-boolean p1, p0, LT0/p$a;->n:Z

    .line 129
    .line 130
    iget-object p1, p0, LT0/p$a;->s:LT0/p;

    .line 131
    .line 132
    invoke-static {p1}, LT0/p;->q0(LT0/p;)Lcom/android/launcher3/folder/Folder;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getContentWrapper()Landroid/view/View;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    check-cast p1, Landroid/view/ViewGroup;

    .line 141
    .line 142
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getClipChildren()Z

    .line 143
    .line 144
    .line 145
    move-result p1

    .line 146
    iput-boolean p1, p0, LT0/p$a;->q:Z

    .line 147
    .line 148
    iget-object p1, p0, LT0/p$a;->s:LT0/p;

    .line 149
    .line 150
    invoke-static {p1}, LT0/p;->r0(LT0/p;)Lcom/android/launcher3/folder/Folder;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getContentWrapper()Landroid/view/View;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    check-cast p1, Landroid/view/ViewGroup;

    .line 159
    .line 160
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getClipToPadding()Z

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    iput-boolean p1, p0, LT0/p$a;->r:Z

    .line 165
    .line 166
    iget-object p1, p0, LT0/p$a;->h:Lcom/android/launcher3/K5;

    .line 167
    .line 168
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getClipChildren()Z

    .line 169
    .line 170
    .line 171
    move-result p1

    .line 172
    iput-boolean p1, p0, LT0/p$a;->o:Z

    .line 173
    .line 174
    iget-object p1, p0, LT0/p$a;->h:Lcom/android/launcher3/K5;

    .line 175
    .line 176
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getClipToPadding()Z

    .line 177
    .line 178
    .line 179
    move-result p1

    .line 180
    iput-boolean p1, p0, LT0/p$a;->p:Z

    .line 181
    .line 182
    iget-object p1, p0, LT0/p$a;->s:LT0/p;

    .line 183
    .line 184
    invoke-static {p1}, LT0/p;->s0(LT0/p;)Lcom/android/launcher3/folder/Folder;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setClipChildren(Z)V

    .line 189
    .line 190
    .line 191
    iget-object p1, p0, LT0/p$a;->s:LT0/p;

    .line 192
    .line 193
    invoke-static {p1}, LT0/p;->B(LT0/p;)Lcom/android/launcher3/folder/Folder;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setClipToPadding(Z)V

    .line 198
    .line 199
    .line 200
    iget-object p1, p0, LT0/p$a;->s:LT0/p;

    .line 201
    .line 202
    invoke-static {p1}, LT0/p;->C(LT0/p;)Lcom/android/launcher3/folder/FolderPagedView;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 207
    .line 208
    .line 209
    iget-object p1, p0, LT0/p$a;->s:LT0/p;

    .line 210
    .line 211
    invoke-static {p1}, LT0/p;->D(LT0/p;)Lcom/android/launcher3/folder/FolderPagedView;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 216
    .line 217
    .line 218
    iget-object p1, p0, LT0/p$a;->g:Lcom/android/launcher3/CellLayout;

    .line 219
    .line 220
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 221
    .line 222
    .line 223
    iget-object p1, p0, LT0/p$a;->g:Lcom/android/launcher3/CellLayout;

    .line 224
    .line 225
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 226
    .line 227
    .line 228
    iget-object p1, p0, LT0/p$a;->h:Lcom/android/launcher3/K5;

    .line 229
    .line 230
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 231
    .line 232
    .line 233
    iget-object p1, p0, LT0/p$a;->h:Lcom/android/launcher3/K5;

    .line 234
    .line 235
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 236
    .line 237
    .line 238
    iget-object p1, p0, LT0/p$a;->s:LT0/p;

    .line 239
    .line 240
    invoke-static {p1}, LT0/p;->E(LT0/p;)Lcom/android/launcher3/folder/Folder;

    .line 241
    .line 242
    .line 243
    move-result-object p1

    .line 244
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getContentWrapper()Landroid/view/View;

    .line 245
    .line 246
    .line 247
    move-result-object p1

    .line 248
    check-cast p1, Landroid/view/ViewGroup;

    .line 249
    .line 250
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 251
    .line 252
    .line 253
    iget-object p1, p0, LT0/p$a;->s:LT0/p;

    .line 254
    .line 255
    invoke-static {p1}, LT0/p;->F(LT0/p;)Lcom/android/launcher3/folder/Folder;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->getContentWrapper()Landroid/view/View;

    .line 260
    .line 261
    .line 262
    move-result-object p1

    .line 263
    check-cast p1, Landroid/view/ViewGroup;

    .line 264
    .line 265
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 266
    .line 267
    .line 268
    iget-object p1, p0, LT0/p$a;->s:LT0/p;

    .line 269
    .line 270
    invoke-static {p1}, LT0/p;->G(LT0/p;)Lcom/android/launcher3/folder/Folder;

    .line 271
    .line 272
    .line 273
    move-result-object p1

    .line 274
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 275
    .line 276
    invoke-virtual {p1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 277
    .line 278
    .line 279
    move-result-object p1

    .line 280
    if-nez p1, :cond_3

    .line 281
    .line 282
    goto/16 :goto_2

    .line 283
    .line 284
    :cond_3
    new-instance v2, Ljava/util/ArrayList;

    .line 285
    .line 286
    iget-object v3, p0, LT0/p$a;->s:LT0/p;

    .line 287
    .line 288
    invoke-static {v3}, LT0/p;->H(LT0/p;)Lcom/android/launcher3/folder/FolderPagedView;

    .line 289
    .line 290
    .line 291
    move-result-object v3

    .line 292
    invoke-virtual {v3, v0}, Lcom/android/launcher3/folder/FolderPagedView;->g0(I)Ljava/util/List;

    .line 293
    .line 294
    .line 295
    move-result-object v3

    .line 296
    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 297
    .line 298
    .line 299
    move v3, v0

    .line 300
    :goto_0
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 301
    .line 302
    .line 303
    move-result v4

    .line 304
    if-ge v3, v4, :cond_7

    .line 305
    .line 306
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 307
    .line 308
    .line 309
    move-result-object v4

    .line 310
    check-cast v4, Landroid/view/View;

    .line 311
    .line 312
    invoke-virtual {v4, p2}, Landroid/view/View;->setAlpha(F)V

    .line 313
    .line 314
    .line 315
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 316
    .line 317
    .line 318
    move-result-object v5

    .line 319
    invoke-virtual {v5}, Lcom/android/launcher3/q4;->a0()Z

    .line 320
    .line 321
    .line 322
    move-result v5

    .line 323
    if-eqz v5, :cond_4

    .line 324
    .line 325
    instance-of v5, v4, Lcom/android/launcher3/BubbleTextView;

    .line 326
    .line 327
    if-eqz v5, :cond_4

    .line 328
    .line 329
    move-object v5, v4

    .line 330
    check-cast v5, Lcom/android/launcher3/BubbleTextView;

    .line 331
    .line 332
    invoke-virtual {v5}, Lcom/android/launcher3/BubbleTextView;->o0()Z

    .line 333
    .line 334
    .line 335
    move-result v6

    .line 336
    if-nez v6, :cond_4

    .line 337
    .line 338
    invoke-virtual {v5, v1}, Lcom/android/launcher3/BubbleTextView;->setShouldHideCheckbox(Z)V

    .line 339
    .line 340
    .line 341
    :cond_4
    instance-of v5, v4, Lcom/android/launcher3/BubbleTextView;

    .line 342
    .line 343
    if-eqz v5, :cond_6

    .line 344
    .line 345
    check-cast v4, Lcom/android/launcher3/BubbleTextView;

    .line 346
    .line 347
    invoke-virtual {v4}, Lcom/android/launcher3/BubbleTextView;->f0()Z

    .line 348
    .line 349
    .line 350
    move-result v5

    .line 351
    if-eqz v5, :cond_5

    .line 352
    .line 353
    invoke-virtual {v4, v1}, Lcom/android/launcher3/BubbleTextView;->setForceHideDot(Z)V

    .line 354
    .line 355
    .line 356
    :cond_5
    invoke-virtual {v4}, Lcom/android/launcher3/BubbleTextView;->k0()Z

    .line 357
    .line 358
    .line 359
    move-result v5

    .line 360
    if-eqz v5, :cond_6

    .line 361
    .line 362
    invoke-virtual {v4, v1}, Lcom/android/launcher3/BubbleTextView;->setForceHideDownloadMark(Z)V

    .line 363
    .line 364
    .line 365
    :cond_6
    add-int/2addr v3, v1

    .line 366
    goto :goto_0

    .line 367
    :cond_7
    iget-object p1, p0, LT0/p$a;->s:LT0/p;

    .line 368
    .line 369
    invoke-static {p1}, LT0/p;->I(LT0/p;)Z

    .line 370
    .line 371
    .line 372
    move-result p1

    .line 373
    if-eqz p1, :cond_b

    .line 374
    .line 375
    iget-object p0, p0, LT0/p$a;->s:LT0/p;

    .line 376
    .line 377
    invoke-static {p0}, LT0/p;->J(LT0/p;)Lcom/android/launcher3/folder/FolderIcon;

    .line 378
    .line 379
    .line 380
    move-result-object p0

    .line 381
    instance-of p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 382
    .line 383
    if-eqz p1, :cond_b

    .line 384
    .line 385
    check-cast p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 386
    .line 387
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->getBigChildBubbleTextViewList()Ljava/util/ArrayList;

    .line 388
    .line 389
    .line 390
    move-result-object p1

    .line 391
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 392
    .line 393
    .line 394
    move-result-object p1

    .line 395
    :cond_8
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 396
    .line 397
    .line 398
    move-result p2

    .line 399
    if-eqz p2, :cond_a

    .line 400
    .line 401
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 402
    .line 403
    .line 404
    move-result-object p2

    .line 405
    check-cast p2, Lcom/android/launcher3/BubbleTextView;

    .line 406
    .line 407
    invoke-virtual {p2}, Lcom/android/launcher3/BubbleTextView;->f0()Z

    .line 408
    .line 409
    .line 410
    move-result v2

    .line 411
    if-eqz v2, :cond_9

    .line 412
    .line 413
    invoke-virtual {p2, v1}, Lcom/android/launcher3/BubbleTextView;->setForceHideDot(Z)V

    .line 414
    .line 415
    .line 416
    :cond_9
    invoke-virtual {p2}, Lcom/android/launcher3/BubbleTextView;->k0()Z

    .line 417
    .line 418
    .line 419
    move-result v2

    .line 420
    if-eqz v2, :cond_8

    .line 421
    .line 422
    invoke-virtual {p2, v1}, Lcom/android/launcher3/BubbleTextView;->setForceHideDownloadMark(Z)V

    .line 423
    .line 424
    .line 425
    goto :goto_1

    .line 426
    :cond_a
    invoke-virtual {p0}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->H()Z

    .line 427
    .line 428
    .line 429
    move-result p1

    .line 430
    if-eqz p1, :cond_b

    .line 431
    .line 432
    iget-object p1, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 433
    .line 434
    if-eqz p1, :cond_b

    .line 435
    .line 436
    invoke-virtual {p0, v1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->setForceHideDot(Z)V

    .line 437
    .line 438
    .line 439
    iget-object p0, p0, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->g0:Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;

    .line 440
    .line 441
    new-array p1, v1, [F

    .line 442
    .line 443
    const/4 p2, 0x0

    .line 444
    aput p2, p1, v0

    .line 445
    .line 446
    invoke-virtual {p0, p1}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIconItems;->a([F)V

    .line 447
    .line 448
    .line 449
    :cond_b
    :goto_2
    return-void
.end method
