.class final Landroidx/fragment/app/W$b;
.super Landroidx/fragment/app/W$c;
.source "SpecialEffectsController.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/fragment/app/W;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "b"
.end annotation


# instance fields
.field private final h:Landroidx/fragment/app/L;


# direct methods
.method public constructor <init>(Landroidx/fragment/app/W$c$b;Landroidx/fragment/app/W$c$a;Landroidx/fragment/app/L;LF/d;)V
    .locals 2

    .line 1
    const-string v0, "finalState"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "lifecycleImpact"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "fragmentStateManager"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "cancellationSignal"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p3}, Landroidx/fragment/app/L;->k()Landroidx/fragment/app/n;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "fragmentStateManager.fragment"

    .line 26
    .line 27
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-direct {p0, p1, p2, v0, p4}, Landroidx/fragment/app/W$c;-><init>(Landroidx/fragment/app/W$c$b;Landroidx/fragment/app/W$c$a;Landroidx/fragment/app/n;LF/d;)V

    .line 31
    .line 32
    .line 33
    iput-object p3, p0, Landroidx/fragment/app/W$b;->h:Landroidx/fragment/app/L;

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public e()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/W$c;->e()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Landroidx/fragment/app/W$b;->h:Landroidx/fragment/app/L;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/fragment/app/L;->m()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public n()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/W$c;->i()Landroidx/fragment/app/W$c$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Landroidx/fragment/app/W$c$a;->h:Landroidx/fragment/app/W$c$a;

    .line 6
    .line 7
    const-string v2, " for Fragment "

    .line 8
    .line 9
    const-string v3, "FragmentManager"

    .line 10
    .line 11
    const/4 v4, 0x2

    .line 12
    const-string v5, "fragmentStateManager.fragment"

    .line 13
    .line 14
    if-ne v0, v1, :cond_3

    .line 15
    .line 16
    iget-object v0, p0, Landroidx/fragment/app/W$b;->h:Landroidx/fragment/app/L;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroidx/fragment/app/L;->k()Landroidx/fragment/app/n;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {v0, v5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, v0, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 26
    .line 27
    invoke-virtual {v1}, Landroid/view/View;->findFocus()Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroidx/fragment/app/n;->setFocusedView(Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v4}, Landroidx/fragment/app/F;->J0(I)Z

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    if-eqz v4, :cond_0

    .line 41
    .line 42
    new-instance v4, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .line 46
    .line 47
    const-string v5, "requestFocus: Saved focused view "

    .line 48
    .line 49
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-static {v3, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v1}, Landroidx/fragment/app/n;->requireView()Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    const-string v2, "this.fragment.requireView()"

    .line 77
    .line 78
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    const/4 v3, 0x0

    .line 86
    if-nez v2, :cond_1

    .line 87
    .line 88
    iget-object p0, p0, Landroidx/fragment/app/W$b;->h:Landroidx/fragment/app/L;

    .line 89
    .line 90
    invoke-virtual {p0}, Landroidx/fragment/app/L;->b()V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1, v3}, Landroid/view/View;->setAlpha(F)V

    .line 94
    .line 95
    .line 96
    :cond_1
    invoke-virtual {v1}, Landroid/view/View;->getAlpha()F

    .line 97
    .line 98
    .line 99
    move-result p0

    .line 100
    cmpg-float p0, p0, v3

    .line 101
    .line 102
    if-nez p0, :cond_2

    .line 103
    .line 104
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    if-nez p0, :cond_2

    .line 109
    .line 110
    const/4 p0, 0x4

    .line 111
    invoke-virtual {v1, p0}, Landroid/view/View;->setVisibility(I)V

    .line 112
    .line 113
    .line 114
    :cond_2
    invoke-virtual {v0}, Landroidx/fragment/app/n;->getPostOnViewCreatedAlpha()F

    .line 115
    .line 116
    .line 117
    move-result p0

    .line 118
    invoke-virtual {v1, p0}, Landroid/view/View;->setAlpha(F)V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :cond_3
    invoke-virtual {p0}, Landroidx/fragment/app/W$c;->i()Landroidx/fragment/app/W$c$a;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    sget-object v1, Landroidx/fragment/app/W$c$a;->i:Landroidx/fragment/app/W$c$a;

    .line 127
    .line 128
    if-ne v0, v1, :cond_5

    .line 129
    .line 130
    iget-object p0, p0, Landroidx/fragment/app/W$b;->h:Landroidx/fragment/app/L;

    .line 131
    .line 132
    invoke-virtual {p0}, Landroidx/fragment/app/L;->k()Landroidx/fragment/app/n;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-static {p0, v5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p0}, Landroidx/fragment/app/n;->requireView()Landroid/view/View;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    const-string v1, "fragment.requireView()"

    .line 144
    .line 145
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    invoke-static {v4}, Landroidx/fragment/app/F;->J0(I)Z

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    if-eqz v1, :cond_4

    .line 153
    .line 154
    new-instance v1, Ljava/lang/StringBuilder;

    .line 155
    .line 156
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 157
    .line 158
    .line 159
    const-string v4, "Clearing focus "

    .line 160
    .line 161
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v0}, Landroid/view/View;->findFocus()Landroid/view/View;

    .line 165
    .line 166
    .line 167
    move-result-object v4

    .line 168
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    const-string v4, " on view "

    .line 172
    .line 173
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    invoke-static {v3, p0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    .line 191
    .line 192
    :cond_4
    invoke-virtual {v0}, Landroid/view/View;->clearFocus()V

    .line 193
    .line 194
    .line 195
    :cond_5
    return-void
.end method
