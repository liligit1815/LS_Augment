.class Lcom/zte/mifavor/widget/NumberPickerZTE$k;
.super Ljava/lang/Object;
.source "NumberPickerZTE.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/widget/NumberPickerZTE;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "k"
.end annotation


# instance fields
.field private g:I

.field private h:I

.field final synthetic i:Lcom/zte/mifavor/widget/NumberPickerZTE;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/NumberPickerZTE;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->c()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->h:I

    .line 6
    .line 7
    iput p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->g:I

    .line 8
    .line 9
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 10
    .line 11
    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    int-to-long v0, v0

    .line 16
    invoke-virtual {p1, p0, v0, v1}, Landroid/widget/LinearLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public b(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->c()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    iput v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->h:I

    .line 6
    .line 7
    iput p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->g:I

    .line 8
    .line 9
    iget-object p1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public c()V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->h:I

    .line 3
    .line 4
    iput v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->g:I

    .line 5
    .line 6
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 7
    .line 8
    invoke-virtual {v1, p0}, Landroid/widget/LinearLayout;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 12
    .line 13
    invoke-static {v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->d(Lcom/zte/mifavor/widget/NumberPickerZTE;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 20
    .line 21
    invoke-static {v1, v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->o(Lcom/zte/mifavor/widget/NumberPickerZTE;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 25
    .line 26
    invoke-static {v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->a(Lcom/zte/mifavor/widget/NumberPickerZTE;)I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    iget-object v3, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 31
    .line 32
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getRight()I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    iget-object v4, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 37
    .line 38
    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getBottom()I

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    invoke-virtual {v1, v0, v2, v3, v4}, Landroid/widget/LinearLayout;->invalidate(IIII)V

    .line 43
    .line 44
    .line 45
    :cond_0
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 46
    .line 47
    invoke-static {v1, v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->n(Lcom/zte/mifavor/widget/NumberPickerZTE;Z)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 51
    .line 52
    invoke-static {v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->b(Lcom/zte/mifavor/widget/NumberPickerZTE;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-eqz v1, :cond_1

    .line 57
    .line 58
    iget-object v1, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 59
    .line 60
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getRight()I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 65
    .line 66
    invoke-static {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->k(Lcom/zte/mifavor/widget/NumberPickerZTE;)I

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    invoke-virtual {v1, v0, v0, v2, p0}, Landroid/widget/LinearLayout;->invalidate(IIII)V

    .line 71
    .line 72
    .line 73
    :cond_1
    return-void
.end method

.method public run()V
    .locals 6

    .line 1
    iget v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->h:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x1

    .line 6
    if-eq v0, v3, :cond_5

    .line 7
    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->g:I

    .line 12
    .line 13
    if-eq v0, v3, :cond_3

    .line 14
    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->b(Lcom/zte/mifavor/widget/NumberPickerZTE;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 27
    .line 28
    invoke-static {}, Landroid/view/ViewConfiguration;->getPressedStateDuration()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    int-to-long v4, v1

    .line 33
    invoke-virtual {v0, p0, v4, v5}, Landroid/widget/LinearLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 34
    .line 35
    .line 36
    :cond_2
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 37
    .line 38
    invoke-static {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->b(Lcom/zte/mifavor/widget/NumberPickerZTE;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    xor-int/2addr v1, v3

    .line 43
    invoke-static {v0, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->n(Lcom/zte/mifavor/widget/NumberPickerZTE;Z)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getRight()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 53
    .line 54
    invoke-static {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->k(Lcom/zte/mifavor/widget/NumberPickerZTE;)I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    invoke-virtual {v0, v2, v2, v1, p0}, Landroid/widget/LinearLayout;->invalidate(IIII)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_3
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 63
    .line 64
    invoke-static {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->d(Lcom/zte/mifavor/widget/NumberPickerZTE;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_4

    .line 69
    .line 70
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 71
    .line 72
    invoke-static {}, Landroid/view/ViewConfiguration;->getPressedStateDuration()I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    int-to-long v4, v1

    .line 77
    invoke-virtual {v0, p0, v4, v5}, Landroid/widget/LinearLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 78
    .line 79
    .line 80
    :cond_4
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 81
    .line 82
    invoke-static {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->d(Lcom/zte/mifavor/widget/NumberPickerZTE;)Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    xor-int/2addr v1, v3

    .line 87
    invoke-static {v0, v1}, Lcom/zte/mifavor/widget/NumberPickerZTE;->o(Lcom/zte/mifavor/widget/NumberPickerZTE;Z)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 91
    .line 92
    invoke-static {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->a(Lcom/zte/mifavor/widget/NumberPickerZTE;)I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    iget-object v3, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 97
    .line 98
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getRight()I

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 103
    .line 104
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getBottom()I

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    invoke-virtual {v0, v2, v1, v3, p0}, Landroid/widget/LinearLayout;->invalidate(IIII)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_5
    iget v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->g:I

    .line 113
    .line 114
    if-eq v0, v3, :cond_7

    .line 115
    .line 116
    if-eq v0, v1, :cond_6

    .line 117
    .line 118
    :goto_0
    return-void

    .line 119
    :cond_6
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 120
    .line 121
    invoke-static {v0, v3}, Lcom/zte/mifavor/widget/NumberPickerZTE;->n(Lcom/zte/mifavor/widget/NumberPickerZTE;Z)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 125
    .line 126
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getRight()I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 131
    .line 132
    invoke-static {p0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->k(Lcom/zte/mifavor/widget/NumberPickerZTE;)I

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    invoke-virtual {v0, v2, v2, v1, p0}, Landroid/widget/LinearLayout;->invalidate(IIII)V

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :cond_7
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 141
    .line 142
    invoke-static {v0, v3}, Lcom/zte/mifavor/widget/NumberPickerZTE;->o(Lcom/zte/mifavor/widget/NumberPickerZTE;Z)V

    .line 143
    .line 144
    .line 145
    iget-object v0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 146
    .line 147
    invoke-static {v0}, Lcom/zte/mifavor/widget/NumberPickerZTE;->a(Lcom/zte/mifavor/widget/NumberPickerZTE;)I

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    iget-object v3, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 152
    .line 153
    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getRight()I

    .line 154
    .line 155
    .line 156
    move-result v3

    .line 157
    iget-object p0, p0, Lcom/zte/mifavor/widget/NumberPickerZTE$k;->i:Lcom/zte/mifavor/widget/NumberPickerZTE;

    .line 158
    .line 159
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getBottom()I

    .line 160
    .line 161
    .line 162
    move-result p0

    .line 163
    invoke-virtual {v0, v2, v1, v3, p0}, Landroid/widget/LinearLayout;->invalidate(IIII)V

    .line 164
    .line 165
    .line 166
    return-void
.end method
