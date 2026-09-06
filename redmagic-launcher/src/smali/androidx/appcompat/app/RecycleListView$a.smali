.class Landroidx/appcompat/app/RecycleListView$a;
.super Ljava/lang/Object;
.source "RecycleListView.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/appcompat/app/RecycleListView;->onFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/appcompat/app/RecycleListView$a$a;
    }
.end annotation


# instance fields
.field private a:Landroid/util/SparseArray;

.field private b:I

.field final synthetic c:Landroidx/appcompat/app/RecycleListView;


# direct methods
.method constructor <init>(Landroidx/appcompat/app/RecycleListView;)V
    .locals 1

    .line 1
    iput-object p1, p0, Landroidx/appcompat/app/RecycleListView$a;->c:Landroidx/appcompat/app/RecycleListView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Landroid/util/SparseArray;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-direct {p1, v0}, Landroid/util/SparseArray;-><init>(I)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Landroidx/appcompat/app/RecycleListView$a;->a:Landroid/util/SparseArray;

    .line 13
    .line 14
    iput v0, p0, Landroidx/appcompat/app/RecycleListView$a;->b:I

    .line 15
    .line 16
    return-void
.end method

.method private a()I
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget v2, p0, Landroidx/appcompat/app/RecycleListView$a;->b:I

    .line 4
    .line 5
    if-ge v0, v2, :cond_1

    .line 6
    .line 7
    iget-object v2, p0, Landroidx/appcompat/app/RecycleListView$a;->a:Landroid/util/SparseArray;

    .line 8
    .line 9
    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Landroidx/appcompat/app/RecycleListView$a$a;

    .line 14
    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    iget v2, v2, Landroidx/appcompat/app/RecycleListView$a$a;->a:I

    .line 18
    .line 19
    add-int/2addr v1, v2

    .line 20
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    iget-object v0, p0, Landroidx/appcompat/app/RecycleListView$a;->a:Landroid/util/SparseArray;

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Landroidx/appcompat/app/RecycleListView$a$a;

    .line 30
    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    new-instance v0, Landroidx/appcompat/app/RecycleListView$a$a;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Landroidx/appcompat/app/RecycleListView$a$a;-><init>(Landroidx/appcompat/app/RecycleListView$a;)V

    .line 36
    .line 37
    .line 38
    :cond_2
    iget p0, v0, Landroidx/appcompat/app/RecycleListView$a$a;->b:I

    .line 39
    .line 40
    sub-int/2addr v1, p0

    .line 41
    return v1
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 0

    .line 1
    iput p2, p0, Landroidx/appcompat/app/RecycleListView$a;->b:I

    .line 2
    .line 3
    const/4 p3, 0x0

    .line 4
    invoke-virtual {p1, p3}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    iget-object p3, p0, Landroidx/appcompat/app/RecycleListView$a;->a:Landroid/util/SparseArray;

    .line 11
    .line 12
    invoke-virtual {p3, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p3

    .line 16
    check-cast p3, Landroidx/appcompat/app/RecycleListView$a$a;

    .line 17
    .line 18
    if-nez p3, :cond_0

    .line 19
    .line 20
    new-instance p3, Landroidx/appcompat/app/RecycleListView$a$a;

    .line 21
    .line 22
    invoke-direct {p3, p0}, Landroidx/appcompat/app/RecycleListView$a$a;-><init>(Landroidx/appcompat/app/RecycleListView$a;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result p4

    .line 29
    iput p4, p3, Landroidx/appcompat/app/RecycleListView$a$a;->a:I

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 32
    .line 33
    .line 34
    move-result p4

    .line 35
    iput p4, p3, Landroidx/appcompat/app/RecycleListView$a$a;->b:I

    .line 36
    .line 37
    iget-object p4, p0, Landroidx/appcompat/app/RecycleListView$a;->a:Landroid/util/SparseArray;

    .line 38
    .line 39
    invoke-virtual {p4, p2, p3}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    iget p2, p3, Landroidx/appcompat/app/RecycleListView$a$a;->a:I

    .line 43
    .line 44
    if-eqz p2, :cond_1

    .line 45
    .line 46
    invoke-direct {p0}, Landroidx/appcompat/app/RecycleListView$a;->a()I

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    div-int/2addr p2, p1

    .line 55
    iget-object p1, p0, Landroidx/appcompat/app/RecycleListView$a;->c:Landroidx/appcompat/app/RecycleListView;

    .line 56
    .line 57
    invoke-static {p1}, Landroidx/appcompat/app/RecycleListView;->d(Landroidx/appcompat/app/RecycleListView;)I

    .line 58
    .line 59
    .line 60
    move-result p3

    .line 61
    sub-int/2addr p3, p2

    .line 62
    invoke-static {p1, p3}, Landroidx/appcompat/app/RecycleListView;->e(Landroidx/appcompat/app/RecycleListView;I)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Landroidx/appcompat/app/RecycleListView$a;->c:Landroidx/appcompat/app/RecycleListView;

    .line 66
    .line 67
    invoke-static {p1}, Landroidx/appcompat/app/RecycleListView;->c(Landroidx/appcompat/app/RecycleListView;)Lb4/e;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iget-object p0, p0, Landroidx/appcompat/app/RecycleListView$a;->c:Landroidx/appcompat/app/RecycleListView;

    .line 72
    .line 73
    invoke-static {p0}, Landroidx/appcompat/app/RecycleListView;->d(Landroidx/appcompat/app/RecycleListView;)I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    invoke-virtual {p1, p0}, Lb4/e;->C(I)V

    .line 78
    .line 79
    .line 80
    :cond_1
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 4

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "onScrollStateChanged in, state = "

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string v0, "Z#View-RecycleListViewX"

    .line 19
    .line 20
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Landroidx/appcompat/app/RecycleListView$a;->c:Landroidx/appcompat/app/RecycleListView;

    .line 24
    .line 25
    invoke-static {p1}, Landroidx/appcompat/app/RecycleListView;->b(Landroidx/appcompat/app/RecycleListView;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    iget-object p1, p0, Landroidx/appcompat/app/RecycleListView$a;->c:Landroidx/appcompat/app/RecycleListView;

    .line 32
    .line 33
    invoke-static {p1}, Landroidx/appcompat/app/RecycleListView;->c(Landroidx/appcompat/app/RecycleListView;)Lb4/e;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    if-nez p1, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    if-nez p2, :cond_1

    .line 41
    .line 42
    iget-object p1, p0, Landroidx/appcompat/app/RecycleListView$a;->c:Landroidx/appcompat/app/RecycleListView;

    .line 43
    .line 44
    invoke-static {p1}, Landroidx/appcompat/app/RecycleListView;->c(Landroidx/appcompat/app/RecycleListView;)Lb4/e;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Lb4/e;->t()Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_1

    .line 53
    .line 54
    iget-object p1, p0, Landroidx/appcompat/app/RecycleListView$a;->c:Landroidx/appcompat/app/RecycleListView;

    .line 55
    .line 56
    const/4 v1, -0x1

    .line 57
    invoke-virtual {p1, v1}, Landroid/widget/ListView;->canScrollVertically(I)Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    iget-object v1, p0, Landroidx/appcompat/app/RecycleListView$a;->c:Landroidx/appcompat/app/RecycleListView;

    .line 62
    .line 63
    const/4 v2, 0x1

    .line 64
    invoke-virtual {v1, v2}, Landroid/widget/ListView;->canScrollVertically(I)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    new-instance v2, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .line 72
    .line 73
    const-string v3, "onScrollStateChanged, state = "

    .line 74
    .line 75
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string p2, ", canScrollUp = "

    .line 82
    .line 83
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    const-string p1, ", canScrollDown = "

    .line 90
    .line 91
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Landroidx/appcompat/app/RecycleListView$a;->c:Landroidx/appcompat/app/RecycleListView;

    .line 105
    .line 106
    const/4 p2, 0x0

    .line 107
    invoke-virtual {p1, p2}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iget-object p0, p0, Landroidx/appcompat/app/RecycleListView$a;->c:Landroidx/appcompat/app/RecycleListView;

    .line 112
    .line 113
    invoke-static {p0}, Landroidx/appcompat/app/RecycleListView;->c(Landroidx/appcompat/app/RecycleListView;)Lb4/e;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    const/16 p2, 0x3e9

    .line 118
    .line 119
    invoke-virtual {p0, p1, p2}, Lb4/e;->x(Landroid/view/View;I)V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 126
    .line 127
    .line 128
    const-string p1, "onScrollStateChanged out, state = "

    .line 129
    .line 130
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_2
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 145
    .line 146
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 147
    .line 148
    .line 149
    const-string p2, "onScrollStateChanged don\'t use animation, mIsUseSpring = "

    .line 150
    .line 151
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    iget-object p0, p0, Landroidx/appcompat/app/RecycleListView$a;->c:Landroidx/appcompat/app/RecycleListView;

    .line 155
    .line 156
    invoke-static {p0}, Landroidx/appcompat/app/RecycleListView;->b(Landroidx/appcompat/app/RecycleListView;)Z

    .line 157
    .line 158
    .line 159
    move-result p0

    .line 160
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    .line 169
    .line 170
    return-void
.end method
