.class Lcom/android/launcher3/menu/a$a;
.super LJ/a;
.source "HVScrollView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/menu/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "a"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, LJ/a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public f(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, LJ/a;->f(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2
    .line 3
    .line 4
    check-cast p1, Lcom/android/launcher3/menu/a;

    .line 5
    .line 6
    const-class p0, Landroid/widget/ScrollView;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p2, p0}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p2}, LK/b;->a(Landroid/view/accessibility/AccessibilityEvent;)LK/f;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p1}, Lcom/android/launcher3/menu/a;->b(Lcom/android/launcher3/menu/a;)I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    const/4 v0, 0x0

    .line 24
    const/4 v1, 0x1

    .line 25
    if-lez p2, :cond_0

    .line 26
    .line 27
    move p2, v1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move p2, v0

    .line 30
    :goto_0
    invoke-static {p1}, Lcom/android/launcher3/menu/a;->a(Lcom/android/launcher3/menu/a;)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-lez v2, :cond_1

    .line 35
    .line 36
    move v2, v1

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    move v2, v0

    .line 39
    :goto_1
    if-nez p2, :cond_2

    .line 40
    .line 41
    if-eqz v2, :cond_3

    .line 42
    .line 43
    :cond_2
    move v0, v1

    .line 44
    :cond_3
    invoke-virtual {p0, v0}, LK/f;->k(Z)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getScrollX()I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    invoke-virtual {p0, p2}, LK/f;->i(I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getScrollY()I

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    invoke-virtual {p0, p2}, LK/f;->j(I)V

    .line 59
    .line 60
    .line 61
    invoke-static {p1}, Lcom/android/launcher3/menu/a;->a(Lcom/android/launcher3/menu/a;)I

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    invoke-virtual {p0, p2}, LK/f;->e(I)V

    .line 66
    .line 67
    .line 68
    invoke-static {p1}, Lcom/android/launcher3/menu/a;->b(Lcom/android/launcher3/menu/a;)I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    invoke-virtual {p0, p1}, LK/f;->g(I)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public g(Landroid/view/View;LK/d;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, LJ/a;->g(Landroid/view/View;LK/d;)V

    .line 2
    .line 3
    .line 4
    check-cast p1, Lcom/android/launcher3/menu/a;

    .line 5
    .line 6
    const-class p0, Landroid/widget/ScrollView;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p2, p0}, LK/d;->i0(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/ViewGroup;->isEnabled()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_4

    .line 20
    .line 21
    invoke-static {p1}, Lcom/android/launcher3/menu/a;->b(Lcom/android/launcher3/menu/a;)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    invoke-static {p1}, Lcom/android/launcher3/menu/a;->a(Lcom/android/launcher3/menu/a;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-gtz p0, :cond_0

    .line 30
    .line 31
    if-lez v0, :cond_4

    .line 32
    .line 33
    :cond_0
    const/4 v1, 0x1

    .line 34
    invoke-virtual {p2, v1}, LK/d;->F0(Z)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getScrollY()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-gtz v1, :cond_1

    .line 42
    .line 43
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getScrollX()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-lez v1, :cond_2

    .line 48
    .line 49
    :cond_1
    const/16 v1, 0x2000

    .line 50
    .line 51
    invoke-virtual {p2, v1}, LK/d;->a(I)V

    .line 52
    .line 53
    .line 54
    :cond_2
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getScrollY()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-lt v1, p0, :cond_3

    .line 59
    .line 60
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getScrollX()I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-ge p0, v0, :cond_4

    .line 65
    .line 66
    :cond_3
    const/16 p0, 0x1000

    .line 67
    .line 68
    invoke-virtual {p2, p0}, LK/d;->a(I)V

    .line 69
    .line 70
    .line 71
    :cond_4
    return-void
.end method

.method public j(Landroid/view/View;ILandroid/os/Bundle;)Z
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3}, LJ/a;->j(Landroid/view/View;ILandroid/os/Bundle;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p3, 0x1

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return p3

    .line 9
    :cond_0
    check-cast p1, Lcom/android/launcher3/menu/a;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/ViewGroup;->isEnabled()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/4 v0, 0x0

    .line 16
    if-nez p0, :cond_1

    .line 17
    .line 18
    return v0

    .line 19
    :cond_1
    const/16 p0, 0x1000

    .line 20
    .line 21
    if-eq p2, p0, :cond_5

    .line 22
    .line 23
    const/16 p0, 0x2000

    .line 24
    .line 25
    if-eq p2, p0, :cond_2

    .line 26
    .line 27
    return v0

    .line 28
    :cond_2
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getHeight()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    sub-int/2addr p0, p2

    .line 37
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    sub-int/2addr p0, p2

    .line 42
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getWidth()I

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    sub-int/2addr p2, v1

    .line 51
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    sub-int/2addr p2, v1

    .line 56
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getScrollY()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    sub-int/2addr v1, p0

    .line 61
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getScrollX()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    sub-int/2addr v1, p2

    .line 70
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getScrollY()I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-ne p0, v1, :cond_4

    .line 79
    .line 80
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getScrollX()I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-eq p2, v1, :cond_3

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_3
    return v0

    .line 88
    :cond_4
    :goto_0
    invoke-virtual {p1, p2, p0}, Lcom/android/launcher3/menu/a;->S(II)V

    .line 89
    .line 90
    .line 91
    return p3

    .line 92
    :cond_5
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getHeight()I

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 97
    .line 98
    .line 99
    move-result p2

    .line 100
    sub-int/2addr p0, p2

    .line 101
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 102
    .line 103
    .line 104
    move-result p2

    .line 105
    sub-int/2addr p0, p2

    .line 106
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getWidth()I

    .line 107
    .line 108
    .line 109
    move-result p2

    .line 110
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    sub-int/2addr p2, v1

    .line 115
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    sub-int/2addr p2, v1

    .line 120
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getScrollY()I

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    add-int/2addr v1, p0

    .line 125
    invoke-static {p1}, Lcom/android/launcher3/menu/a;->b(Lcom/android/launcher3/menu/a;)I

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    invoke-static {v1, p0}, Ljava/lang/Math;->min(II)I

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getScrollX()I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    add-int/2addr v1, p2

    .line 138
    invoke-static {p1}, Lcom/android/launcher3/menu/a;->a(Lcom/android/launcher3/menu/a;)I

    .line 139
    .line 140
    .line 141
    move-result p2

    .line 142
    invoke-static {v1, p2}, Ljava/lang/Math;->min(II)I

    .line 143
    .line 144
    .line 145
    move-result p2

    .line 146
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getScrollY()I

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    if-ne p0, v1, :cond_7

    .line 151
    .line 152
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getScrollX()I

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    if-eq p2, v1, :cond_6

    .line 157
    .line 158
    goto :goto_1

    .line 159
    :cond_6
    return v0

    .line 160
    :cond_7
    :goto_1
    invoke-virtual {p1, p2, p0}, Lcom/android/launcher3/menu/a;->S(II)V

    .line 161
    .line 162
    .line 163
    return p3
.end method
