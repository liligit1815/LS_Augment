.class Lcom/android/launcher3/popup/PopupContainerWithArrow$b;
.super Ljava/lang/Object;
.source "PopupContainerWithArrow.java"

# interfaces
.implements Lcom/android/launcher3/dragndrop/p$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/popup/PopupContainerWithArrow;->a0(Z)Lcom/android/launcher3/dragndrop/p$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Z

.field final synthetic h:Lcom/android/launcher3/popup/PopupContainerWithArrow;


# direct methods
.method constructor <init>(Lcom/android/launcher3/popup/PopupContainerWithArrow;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->g:Z

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(D)Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->U(Lcom/android/launcher3/popup/PopupContainerWithArrow;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    int-to-double v0, p0

    .line 8
    cmpl-double p0, p1, v0

    .line 9
    .line 10
    if-lez p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public b(Lcom/android/launcher3/n0$a;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    instance-of p1, p1, Lcom/android/launcher3/widget/T;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 13
    .line 14
    invoke-static {p0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-boolean p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->g:Z

    .line 23
    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 28
    .line 29
    iget-boolean v1, p1, Lcom/android/launcher3/popup/c;->mIsAboveIcon:Z

    .line 30
    .line 31
    const/4 v2, 0x4

    .line 32
    if-eqz v1, :cond_4

    .line 33
    .line 34
    invoke-static {p1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    instance-of p1, p1, Lcom/android/launcher3/BubbleTextView;

    .line 39
    .line 40
    if-eqz p1, :cond_2

    .line 41
    .line 42
    iget-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 43
    .line 44
    invoke-static {p1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Lcom/android/launcher3/BubbleTextView;

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Lcom/android/launcher3/BubbleTextView;->setIconVisible(Z)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 54
    .line 55
    invoke-static {p0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 64
    .line 65
    invoke-static {p1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    instance-of p1, p1, Lcom/android/launcher3/folder/FolderIcon;

    .line 70
    .line 71
    if-eqz p1, :cond_3

    .line 72
    .line 73
    iget-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 74
    .line 75
    invoke-static {p1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    instance-of p1, p1, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 80
    .line 81
    if-nez p1, :cond_3

    .line 82
    .line 83
    iget-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 84
    .line 85
    invoke-static {p1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    check-cast p1, Lcom/android/launcher3/folder/FolderIcon;

    .line 90
    .line 91
    invoke-virtual {p1, v0}, Lcom/android/launcher3/folder/FolderIcon;->setIconVisible(Z)V

    .line 92
    .line 93
    .line 94
    iget-object p0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 95
    .line 96
    invoke-static {p0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_3
    iget-object p0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 105
    .line 106
    invoke-static {p0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_4
    invoke-static {p1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public c(Lcom/android/launcher3/n0$a;Z)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    instance-of p1, p1, Lcom/android/launcher3/widget/T;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 22
    .line 23
    iget-boolean p2, p1, Lcom/android/launcher3/popup/c;->mIsAboveIcon:Z

    .line 24
    .line 25
    if-nez p2, :cond_6

    .line 26
    .line 27
    invoke-static {p1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->V(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_6

    .line 32
    .line 33
    iget-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 34
    .line 35
    invoke-static {p1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    instance-of p1, p1, Lcom/android/launcher3/widget/T;

    .line 40
    .line 41
    if-eqz p1, :cond_6

    .line 42
    .line 43
    iget-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 44
    .line 45
    invoke-static {p1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Lcom/android/launcher3/widget/T;

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/android/launcher3/widget/h;->u()Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_6

    .line 56
    .line 57
    iget-object p0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 58
    .line 59
    invoke-static {p0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    check-cast p0, Lcom/android/launcher3/widget/T;

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/T;->Z(Z)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 70
    .line 71
    invoke-static {p1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    instance-of p1, p1, Lcom/android/launcher3/BubbleTextView;

    .line 76
    .line 77
    const/4 v1, 0x1

    .line 78
    if-eqz p1, :cond_1

    .line 79
    .line 80
    iget-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 81
    .line 82
    invoke-static {p1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    check-cast p1, Lcom/android/launcher3/BubbleTextView;

    .line 87
    .line 88
    invoke-virtual {p1, v1}, Lcom/android/launcher3/BubbleTextView;->setIconVisible(Z)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 92
    .line 93
    invoke-static {p1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 102
    .line 103
    invoke-static {p1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    instance-of p1, p1, Lcom/android/launcher3/folder/FolderIcon;

    .line 108
    .line 109
    if-eqz p1, :cond_2

    .line 110
    .line 111
    iget-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 112
    .line 113
    invoke-static {p1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    check-cast p1, Lcom/android/launcher3/folder/FolderIcon;

    .line 118
    .line 119
    invoke-virtual {p1, v1}, Lcom/android/launcher3/folder/FolderIcon;->setIconVisible(Z)V

    .line 120
    .line 121
    .line 122
    iget-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 123
    .line 124
    invoke-static {p1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 129
    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 133
    .line 134
    invoke-static {p1}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 139
    .line 140
    .line 141
    :goto_0
    iget-boolean p1, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->g:Z

    .line 142
    .line 143
    if-nez p1, :cond_3

    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_3
    const/4 p1, 0x4

    .line 147
    if-eqz p2, :cond_4

    .line 148
    .line 149
    iget-object p0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 150
    .line 151
    invoke-static {p0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 156
    .line 157
    .line 158
    return-void

    .line 159
    :cond_4
    iget-object p2, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 160
    .line 161
    iget-boolean v1, p2, Lcom/android/launcher3/popup/c;->mIsAboveIcon:Z

    .line 162
    .line 163
    if-nez v1, :cond_7

    .line 164
    .line 165
    invoke-static {p2}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->W(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Z

    .line 166
    .line 167
    .line 168
    move-result p2

    .line 169
    if-eqz p2, :cond_7

    .line 170
    .line 171
    iget-object p2, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 172
    .line 173
    invoke-static {p2}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 174
    .line 175
    .line 176
    move-result-object p2

    .line 177
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 178
    .line 179
    .line 180
    iget-object p2, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 181
    .line 182
    invoke-static {p2}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 183
    .line 184
    .line 185
    move-result-object p2

    .line 186
    instance-of p2, p2, Lcom/android/launcher3/BubbleTextView;

    .line 187
    .line 188
    if-eqz p2, :cond_5

    .line 189
    .line 190
    iget-object p0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 191
    .line 192
    invoke-static {p0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    check-cast p0, Lcom/android/launcher3/BubbleTextView;

    .line 197
    .line 198
    invoke-virtual {p0, v0}, Lcom/android/launcher3/BubbleTextView;->setTextVisibility(Z)V

    .line 199
    .line 200
    .line 201
    return-void

    .line 202
    :cond_5
    iget-object p2, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 203
    .line 204
    invoke-static {p2}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 205
    .line 206
    .line 207
    move-result-object p2

    .line 208
    instance-of p2, p2, Lcom/android/launcher3/folder/FolderIcon;

    .line 209
    .line 210
    if-eqz p2, :cond_6

    .line 211
    .line 212
    iget-object p0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 213
    .line 214
    invoke-static {p0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    check-cast p0, Lcom/android/launcher3/folder/FolderIcon;

    .line 219
    .line 220
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderIcon;->getFolderName()Lcom/android/launcher3/BubbleTextView;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 225
    .line 226
    .line 227
    :cond_6
    :goto_1
    return-void

    .line 228
    :cond_7
    iget-object p0, p0, Lcom/android/launcher3/popup/PopupContainerWithArrow$b;->h:Lcom/android/launcher3/popup/PopupContainerWithArrow;

    .line 229
    .line 230
    invoke-static {p0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->T(Lcom/android/launcher3/popup/PopupContainerWithArrow;)Landroid/view/View;

    .line 231
    .line 232
    .line 233
    move-result-object p0

    .line 234
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 235
    .line 236
    .line 237
    return-void
.end method
