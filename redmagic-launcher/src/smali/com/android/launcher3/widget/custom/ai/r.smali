.class public Lcom/android/launcher3/widget/custom/ai/r;
.super Landroid/widget/FrameLayout;
.source "CustomCardContainer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/widget/custom/ai/r$a;
    }
.end annotation


# instance fields
.field private g:Lcom/android/launcher3/widget/custom/ai/r$a;

.field private volatile h:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;>;"
        }
    .end annotation
.end field

.field private i:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/custom/ai/r;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/r;->h:Ljava/util/HashMap;

    .line 4
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/r;->i:Ljava/util/ArrayList;

    return-void
.end method

.method private a(Ljava/lang/Object;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/r;->h:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/util/ArrayList;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Landroid/view/View;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method

.method private c(Ljava/lang/Object;Landroid/view/View;)V
    .locals 2

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/r;->h:Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/r;->h:Ljava/util/HashMap;

    .line 13
    .line 14
    new-instance v1, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/r;->h:Ljava/util/HashMap;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method protected b()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/r;->g:Lcom/android/launcher3/widget/custom/ai/r$a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, "CustomCardContainer"

    .line 6
    .line 7
    const-string v0, "notifyDataSetChanged mCallback null return"

    .line 8
    .line 9
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-interface {v0}, Lcom/android/launcher3/widget/custom/ai/r$a;->b()Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/ai/r;->i:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/ai/r;->i:Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/ai/r;->g:Lcom/android/launcher3/widget/custom/ai/r$a;

    .line 28
    .line 29
    invoke-interface {v1}, Lcom/android/launcher3/widget/custom/ai/r$a;->c()Landroid/view/ViewGroup;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    const/4 v4, 0x0

    .line 42
    const v5, 0x7f0b0144

    .line 43
    .line 44
    .line 45
    if-le v2, v3, :cond_3

    .line 46
    .line 47
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    add-int/lit8 v2, v2, -0x1

    .line 52
    .line 53
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    if-lt v2, v3, :cond_3

    .line 58
    .line 59
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->removeViewAt(I)V

    .line 64
    .line 65
    .line 66
    if-eqz v3, :cond_1

    .line 67
    .line 68
    invoke-virtual {v3, v5}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v6

    .line 72
    goto :goto_1

    .line 73
    :cond_1
    move-object v6, v4

    .line 74
    :goto_1
    if-eqz v6, :cond_2

    .line 75
    .line 76
    invoke-direct {p0, v6, v3}, Lcom/android/launcher3/widget/custom/ai/r;->c(Ljava/lang/Object;Landroid/view/View;)V

    .line 77
    .line 78
    .line 79
    :cond_2
    add-int/lit8 v2, v2, -0x1

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_3
    const/4 v2, 0x0

    .line 83
    :goto_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    if-ge v2, v3, :cond_a

    .line 88
    .line 89
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/ai/r;->g:Lcom/android/launcher3/widget/custom/ai/r$a;

    .line 90
    .line 91
    invoke-interface {v3, v2}, Lcom/android/launcher3/widget/custom/ai/r$a;->getItemViewType(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 96
    .line 97
    .line 98
    move-result v6

    .line 99
    if-ge v2, v6, :cond_6

    .line 100
    .line 101
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v6

    .line 105
    invoke-virtual {v6, v5}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v7

    .line 109
    if-eqz v7, :cond_5

    .line 110
    .line 111
    invoke-virtual {v7, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v8

    .line 115
    if-eqz v8, :cond_4

    .line 116
    .line 117
    iget-object v7, p0, Lcom/android/launcher3/widget/custom/ai/r;->g:Lcom/android/launcher3/widget/custom/ai/r$a;

    .line 118
    .line 119
    invoke-interface {v7, v6, v2}, Lcom/android/launcher3/widget/custom/ai/r$a;->a(Landroid/view/View;I)V

    .line 120
    .line 121
    .line 122
    move-object v7, v6

    .line 123
    goto :goto_3

    .line 124
    :cond_4
    invoke-direct {p0, v7, v6}, Lcom/android/launcher3/widget/custom/ai/r;->c(Ljava/lang/Object;Landroid/view/View;)V

    .line 125
    .line 126
    .line 127
    :cond_5
    move-object v7, v4

    .line 128
    :goto_3
    if-eq v7, v6, :cond_7

    .line 129
    .line 130
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->removeViewAt(I)V

    .line 131
    .line 132
    .line 133
    goto :goto_4

    .line 134
    :cond_6
    move-object v7, v4

    .line 135
    :cond_7
    :goto_4
    if-nez v7, :cond_9

    .line 136
    .line 137
    invoke-direct {p0, v3}, Lcom/android/launcher3/widget/custom/ai/r;->a(Ljava/lang/Object;)Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object v6

    .line 141
    if-nez v6, :cond_8

    .line 142
    .line 143
    iget-object v6, p0, Lcom/android/launcher3/widget/custom/ai/r;->g:Lcom/android/launcher3/widget/custom/ai/r$a;

    .line 144
    .line 145
    invoke-interface {v6, v1, v3}, Lcom/android/launcher3/widget/custom/ai/r$a;->d(Landroid/view/ViewGroup;Ljava/lang/Object;)Landroid/view/View;

    .line 146
    .line 147
    .line 148
    move-result-object v6

    .line 149
    invoke-virtual {v6, v5, v3}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 150
    .line 151
    .line 152
    :cond_8
    invoke-virtual {v1, v6, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 153
    .line 154
    .line 155
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/ai/r;->g:Lcom/android/launcher3/widget/custom/ai/r$a;

    .line 156
    .line 157
    invoke-interface {v3, v6, v2}, Lcom/android/launcher3/widget/custom/ai/r$a;->a(Landroid/view/View;I)V

    .line 158
    .line 159
    .line 160
    :cond_9
    add-int/lit8 v2, v2, 0x1

    .line 161
    .line 162
    goto :goto_2

    .line 163
    :cond_a
    return-void
.end method

.method public getAllPageViewList()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/ai/r;->g:Lcom/android/launcher3/widget/custom/ai/r$a;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/ai/r;->g:Lcom/android/launcher3/widget/custom/ai/r$a;

    .line 12
    .line 13
    invoke-interface {v2}, Lcom/android/launcher3/widget/custom/ai/r$a;->c()Landroid/view/ViewGroup;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-ge v1, v2, :cond_0

    .line 22
    .line 23
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/ai/r;->g:Lcom/android/launcher3/widget/custom/ai/r$a;

    .line 24
    .line 25
    invoke-interface {v2}, Lcom/android/launcher3/widget/custom/ai/r$a;->c()Landroid/view/ViewGroup;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    add-int/lit8 v1, v1, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return-object v0
.end method

.method protected onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setCustomCardContainerCallback(Lcom/android/launcher3/widget/custom/ai/r$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/r;->g:Lcom/android/launcher3/widget/custom/ai/r$a;

    .line 2
    .line 3
    return-void
.end method
