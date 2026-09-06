.class public Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;
.super Landroidx/fragment/app/n;
.source "DesktopGridActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/settings/DesktopGridActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DesktopGridFragment"
.end annotation


# static fields
.field private static final B:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private A:I

.field private g:Ljava/lang/String;

.field private h:I

.field private i:Landroid/widget/ImageView;

.field private j:Landroid/widget/ImageView;

.field private k:Landroid/widget/ImageView;

.field private l:Landroid/widget/TextView;

.field private m:Landroid/widget/TextView;

.field private n:Landroid/widget/TextView;

.field private o:Lcom/zte/mifavor/widget/RadioButtonZTE;

.field private p:Lcom/zte/mifavor/widget/RadioButtonZTE;

.field private q:Lcom/zte/mifavor/widget/RadioButtonZTE;

.field private r:Landroid/widget/LinearLayout;

.field private s:Landroid/widget/LinearLayout;

.field private t:Landroid/widget/LinearLayout;

.field private u:I

.field private v:I

.field private w:I

.field private x:I

.field private y:I

.field private z:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0x64

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/16 v1, 0x65

    .line 8
    .line 9
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    filled-new-array {v0, v1}, [Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sput-object v0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->B:Ljava/util/List;

    .line 22
    .line 23
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Landroidx/fragment/app/n;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "DesktopGridFragment"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->g:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x4

    .line 9
    iput v0, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->u:I

    .line 10
    .line 11
    const/4 v1, 0x5

    .line 12
    iput v1, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->v:I

    .line 13
    .line 14
    const/4 v2, 0x6

    .line 15
    iput v2, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->w:I

    .line 16
    .line 17
    iput v0, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->x:I

    .line 18
    .line 19
    iput v1, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->y:I

    .line 20
    .line 21
    iput v2, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->z:I

    .line 22
    .line 23
    const/4 v0, 0x7

    .line 24
    iput v0, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->A:I

    .line 25
    .line 26
    return-void
.end method

.method public static synthetic l(Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->t(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private o(I)V
    .locals 5

    .line 1
    invoke-static {}, Lx1/C;->g()Lx1/C;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lx1/C;->g()Lx1/C;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lx1/C;->h()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->g:Ljava/lang/String;

    .line 18
    .line 19
    const-string p1, "ClickResponse--loadingToast is show"

    .line 20
    .line 21
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->s()V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->o:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 29
    .line 30
    sget-object v1, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->B:Ljava/util/List;

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    check-cast v3, Ljava/lang/Integer;

    .line 38
    .line 39
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    const/4 v4, 0x1

    .line 44
    if-ne p1, v3, :cond_1

    .line 45
    .line 46
    move v3, v4

    .line 47
    goto :goto_0

    .line 48
    :cond_1
    move v3, v2

    .line 49
    :goto_0
    invoke-virtual {v0, v3}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->p:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 53
    .line 54
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    check-cast v1, Ljava/lang/Integer;

    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-ne p1, v1, :cond_2

    .line 65
    .line 66
    move v2, v4

    .line 67
    :cond_2
    invoke-virtual {v0, v2}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getActivity()Landroidx/fragment/app/s;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {v0}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {v0}, Lx1/C;->f(Landroid/content/Context;)Lx1/C;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Lx1/C;->j()V

    .line 83
    .line 84
    .line 85
    iput p1, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->h:I

    .line 86
    .line 87
    invoke-direct {p0}, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->r()V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method private p()V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x17
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->r:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    new-instance v1, LK1/e;

    .line 4
    .line 5
    invoke-direct {v1, p0}, LK1/e;-><init>(Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->s:Landroid/widget/LinearLayout;

    .line 12
    .line 13
    new-instance v1, LK1/f;

    .line 14
    .line 15
    invoke-direct {v1, p0}, LK1/f;-><init>(Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private q()V
    .locals 10
    .annotation build Landroid/annotation/TargetApi;
        value = 0x17
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lcom/android/launcher3/b0;->i(Landroid/content/Context;)Landroid/graphics/Point;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v1, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->g:Ljava/lang/String;

    .line 24
    .line 25
    new-instance v2, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v3, "saved row: "

    .line 31
    .line 32
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    iget v3, v0, Landroid/graphics/Point;->x:I

    .line 36
    .line 37
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v3, " ,column: "

    .line 41
    .line 42
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget v3, v0, Landroid/graphics/Point;->y:I

    .line 46
    .line 47
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    :cond_0
    sget-object v1, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->B:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-eqz v2, :cond_7

    .line 68
    .line 69
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    check-cast v2, Ljava/lang/Integer;

    .line 74
    .line 75
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    invoke-static {v2}, Lcom/android/launcher3/b0;->o(I)Landroid/graphics/Point;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    iget v3, v2, Landroid/graphics/Point;->x:I

    .line 84
    .line 85
    iget v4, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->z:I

    .line 86
    .line 87
    const/4 v5, 0x0

    .line 88
    const/4 v6, 0x1

    .line 89
    const v7, 0x7f140379

    .line 90
    .line 91
    .line 92
    if-ne v3, v4, :cond_4

    .line 93
    .line 94
    iget v8, v2, Landroid/graphics/Point;->y:I

    .line 95
    .line 96
    iget v9, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->u:I

    .line 97
    .line 98
    if-ne v8, v9, :cond_4

    .line 99
    .line 100
    iget-object v3, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->l:Landroid/widget/TextView;

    .line 101
    .line 102
    invoke-virtual {p0, v7}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    iget v7, v2, Landroid/graphics/Point;->y:I

    .line 107
    .line 108
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 109
    .line 110
    .line 111
    move-result-object v7

    .line 112
    iget v2, v2, Landroid/graphics/Point;->x:I

    .line 113
    .line 114
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    filled-new-array {v7, v2}, [Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 127
    .line 128
    .line 129
    if-eqz v0, :cond_3

    .line 130
    .line 131
    iget v2, v0, Landroid/graphics/Point;->y:I

    .line 132
    .line 133
    iget v3, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->u:I

    .line 134
    .line 135
    if-ne v2, v3, :cond_3

    .line 136
    .line 137
    iget v2, v0, Landroid/graphics/Point;->x:I

    .line 138
    .line 139
    iget v3, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->y:I

    .line 140
    .line 141
    if-eq v2, v3, :cond_2

    .line 142
    .line 143
    iget v3, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->z:I

    .line 144
    .line 145
    if-ne v2, v3, :cond_3

    .line 146
    .line 147
    :cond_2
    move v5, v6

    .line 148
    :cond_3
    iget-object v2, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->o:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 149
    .line 150
    invoke-virtual {v2, v5}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 151
    .line 152
    .line 153
    goto :goto_0

    .line 154
    :cond_4
    if-ne v3, v4, :cond_1

    .line 155
    .line 156
    iget v3, v2, Landroid/graphics/Point;->y:I

    .line 157
    .line 158
    iget v4, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->v:I

    .line 159
    .line 160
    if-ne v3, v4, :cond_1

    .line 161
    .line 162
    iget-object v3, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->m:Landroid/widget/TextView;

    .line 163
    .line 164
    invoke-virtual {p0, v7}, Landroidx/fragment/app/n;->getString(I)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v4

    .line 168
    iget v7, v2, Landroid/graphics/Point;->y:I

    .line 169
    .line 170
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 171
    .line 172
    .line 173
    move-result-object v7

    .line 174
    iget v2, v2, Landroid/graphics/Point;->x:I

    .line 175
    .line 176
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    filled-new-array {v7, v2}, [Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object v2

    .line 184
    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 189
    .line 190
    .line 191
    if-eqz v0, :cond_6

    .line 192
    .line 193
    iget v2, v0, Landroid/graphics/Point;->y:I

    .line 194
    .line 195
    iget v3, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->v:I

    .line 196
    .line 197
    if-ne v2, v3, :cond_6

    .line 198
    .line 199
    iget v2, v0, Landroid/graphics/Point;->x:I

    .line 200
    .line 201
    iget v3, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->y:I

    .line 202
    .line 203
    if-eq v2, v3, :cond_5

    .line 204
    .line 205
    iget v3, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->z:I

    .line 206
    .line 207
    if-ne v2, v3, :cond_6

    .line 208
    .line 209
    :cond_5
    move v5, v6

    .line 210
    :cond_6
    iget-object v2, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->p:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 211
    .line 212
    invoke-virtual {v2, v5}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 213
    .line 214
    .line 215
    goto/16 :goto_0

    .line 216
    .line 217
    :cond_7
    return-void
.end method

.method private r()V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x17
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iget p0, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->h:I

    .line 30
    .line 31
    invoke-virtual {v0, v1, p0}, Lcom/android/launcher3/b0;->e(Landroid/content/Context;I)Z

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method private s()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->r:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->s:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic t(Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->B:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Ljava/lang/Integer;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-direct {p0, p1}, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->o(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private synthetic u(Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->B:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Ljava/lang/Integer;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    invoke-direct {p0, p1}, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->o(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/n;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget p2, p2, Landroid/content/res/Configuration;->orientation:I

    .line 10
    .line 11
    const/4 p3, 0x2

    .line 12
    const/4 v0, 0x0

    .line 13
    if-eq p2, p3, :cond_0

    .line 14
    .line 15
    const p2, 0x7f0e01fb

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const p2, 0x7f0e0202

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    :goto_0
    const p2, 0x7f0b0548

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    check-cast p2, Landroid/widget/ImageView;

    .line 38
    .line 39
    iput-object p2, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->i:Landroid/widget/ImageView;

    .line 40
    .line 41
    const p2, 0x7f0b0549

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    check-cast p2, Landroid/widget/ImageView;

    .line 49
    .line 50
    iput-object p2, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->j:Landroid/widget/ImageView;

    .line 51
    .line 52
    const p2, 0x7f0b054a

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    check-cast p2, Landroid/widget/ImageView;

    .line 60
    .line 61
    iput-object p2, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->k:Landroid/widget/ImageView;

    .line 62
    .line 63
    const p2, 0x7f0b05fa

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    check-cast p2, Landroid/widget/TextView;

    .line 71
    .line 72
    iput-object p2, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->l:Landroid/widget/TextView;

    .line 73
    .line 74
    const p2, 0x7f0b05fb

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    check-cast p2, Landroid/widget/TextView;

    .line 82
    .line 83
    iput-object p2, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->m:Landroid/widget/TextView;

    .line 84
    .line 85
    const p2, 0x7f0b05fc

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    check-cast p2, Landroid/widget/TextView;

    .line 93
    .line 94
    iput-object p2, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->n:Landroid/widget/TextView;

    .line 95
    .line 96
    const p2, 0x7f0b04ad

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    check-cast p2, Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 104
    .line 105
    iput-object p2, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->o:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 106
    .line 107
    const p2, 0x7f0b04ae

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    check-cast p2, Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 115
    .line 116
    iput-object p2, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->p:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 117
    .line 118
    const p2, 0x7f0b04af

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    check-cast p2, Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 126
    .line 127
    iput-object p2, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->q:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 128
    .line 129
    const p2, 0x7f0b035f

    .line 130
    .line 131
    .line 132
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 133
    .line 134
    .line 135
    move-result-object p2

    .line 136
    check-cast p2, Landroid/widget/LinearLayout;

    .line 137
    .line 138
    iput-object p2, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->r:Landroid/widget/LinearLayout;

    .line 139
    .line 140
    const p2, 0x7f0b0360

    .line 141
    .line 142
    .line 143
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 144
    .line 145
    .line 146
    move-result-object p2

    .line 147
    check-cast p2, Landroid/widget/LinearLayout;

    .line 148
    .line 149
    iput-object p2, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->s:Landroid/widget/LinearLayout;

    .line 150
    .line 151
    const p2, 0x7f0b0361

    .line 152
    .line 153
    .line 154
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 155
    .line 156
    .line 157
    move-result-object p2

    .line 158
    check-cast p2, Landroid/widget/LinearLayout;

    .line 159
    .line 160
    iput-object p2, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->t:Landroid/widget/LinearLayout;

    .line 161
    .line 162
    invoke-direct {p0}, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->q()V

    .line 163
    .line 164
    .line 165
    invoke-direct {p0}, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->p()V

    .line 166
    .line 167
    .line 168
    iget-object p0, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->g:Ljava/lang/String;

    .line 169
    .line 170
    const-string p2, "onCreateView"

    .line 171
    .line 172
    invoke-static {p0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    .line 174
    .line 175
    return-object p1
.end method

.method public onStart()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/n;->onStart()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    new-instance v1, Landroid/graphics/ColorMatrix;

    .line 15
    .line 16
    invoke-direct {v1}, Landroid/graphics/ColorMatrix;-><init>()V

    .line 17
    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {v1, v2}, Landroid/graphics/ColorMatrix;->setSaturation(F)V

    .line 21
    .line 22
    .line 23
    new-instance v2, Landroid/graphics/ColorMatrixColorFilter;

    .line 24
    .line 25
    invoke-direct {v2, v1}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->i:Landroid/widget/ImageView;

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->j:Landroid/widget/ImageView;

    .line 34
    .line 35
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->i:Landroid/widget/ImageView;

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->j:Landroid/widget/ImageView;

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 48
    .line 49
    .line 50
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->r:Landroid/widget/LinearLayout;

    .line 51
    .line 52
    const/4 v2, 0x0

    .line 53
    const/4 v3, 0x1

    .line 54
    if-nez v0, :cond_1

    .line 55
    .line 56
    iget-object v4, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->o:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 57
    .line 58
    invoke-virtual {v4}, Landroid/widget/RadioButton;->isChecked()Z

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    if-nez v4, :cond_1

    .line 63
    .line 64
    move v4, v3

    .line 65
    goto :goto_1

    .line 66
    :cond_1
    move v4, v2

    .line 67
    :goto_1
    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->s:Landroid/widget/LinearLayout;

    .line 71
    .line 72
    if-nez v0, :cond_2

    .line 73
    .line 74
    iget-object p0, p0, Lcom/android/launcher3/settings/DesktopGridActivity$DesktopGridFragment;->p:Lcom/zte/mifavor/widget/RadioButtonZTE;

    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/widget/RadioButton;->isChecked()Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-nez p0, :cond_2

    .line 81
    .line 82
    move v2, v3

    .line 83
    :cond_2
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setEnabled(Z)V

    .line 84
    .line 85
    .line 86
    return-void
.end method
