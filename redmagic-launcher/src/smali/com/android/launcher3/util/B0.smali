.class public final Lcom/android/launcher3/util/B0;
.super Ljava/lang/Object;
.source "ItemInflater.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/content/Context;",
        ":",
        "Lcom/android/launcher3/views/k;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final a:Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final b:Lcom/android/launcher3/widget/l0;

.field private final c:Landroid/view/View$OnClickListener;

.field private final d:Landroid/view/View$OnFocusChangeListener;

.field private final e:Landroid/view/ViewGroup;

.field private final f:Lcom/android/launcher3/widget/V0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/widget/l0;Landroid/view/View$OnClickListener;Landroid/view/View$OnFocusChangeListener;Landroid/view/ViewGroup;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/android/launcher3/widget/l0;",
            "Landroid/view/View$OnClickListener;",
            "Landroid/view/View$OnFocusChangeListener;",
            "Landroid/view/ViewGroup;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "widgetHolder"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "clickListener"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "focusListener"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string v0, "defaultParent"

    .line 22
    .line 23
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Lcom/android/launcher3/util/B0;->a:Landroid/content/Context;

    .line 30
    .line 31
    iput-object p2, p0, Lcom/android/launcher3/util/B0;->b:Lcom/android/launcher3/widget/l0;

    .line 32
    .line 33
    iput-object p3, p0, Lcom/android/launcher3/util/B0;->c:Landroid/view/View$OnClickListener;

    .line 34
    .line 35
    iput-object p4, p0, Lcom/android/launcher3/util/B0;->d:Landroid/view/View$OnFocusChangeListener;

    .line 36
    .line 37
    iput-object p5, p0, Lcom/android/launcher3/util/B0;->e:Landroid/view/ViewGroup;

    .line 38
    .line 39
    new-instance p2, Lcom/android/launcher3/widget/V0;

    .line 40
    .line 41
    sget-object p3, Lcom/android/launcher3/P2;->g:Lcom/android/launcher3/P2$a;

    .line 42
    .line 43
    invoke-virtual {p3, p1}, Lcom/android/launcher3/P2$a;->b(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 44
    .line 45
    .line 46
    move-result-object p3

    .line 47
    invoke-virtual {p3}, Lcom/android/launcher3/P2;->l()Z

    .line 48
    .line 49
    .line 50
    move-result p3

    .line 51
    invoke-direct {p2, p1, p3}, Lcom/android/launcher3/widget/V0;-><init>(Landroid/content/Context;Z)V

    .line 52
    .line 53
    .line 54
    iput-object p2, p0, Lcom/android/launcher3/util/B0;->f:Lcom/android/launcher3/widget/V0;

    .line 55
    .line 56
    return-void
.end method

.method private final b(Lcom/android/launcher3/model/data/A;Lz1/J3;)Landroid/view/View;
    .locals 6

    .line 1
    sget-object v0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 2
    .line 3
    iget v1, p1, Lcom/android/launcher3/model/data/A;->g:I

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v3, "BIND_WIDGET_id="

    .line 11
    .line 12
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/K2;->beginSection(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher3/util/B0;->f:Lcom/android/launcher3/widget/V0;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/android/launcher3/util/B0;->b:Lcom/android/launcher3/widget/l0;

    .line 28
    .line 29
    invoke-virtual {v0, p1, v1, p2}, Lcom/android/launcher3/widget/V0;->b(Lcom/android/launcher3/model/data/A;Lcom/android/launcher3/widget/l0;Lz1/J3;)Lcom/android/launcher3/widget/V0$b;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Lcom/android/launcher3/widget/V0$b;->a()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    invoke-virtual {v0}, Lcom/android/launcher3/widget/V0$b;->b()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v0}, Lcom/android/launcher3/widget/V0$b;->c()Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    invoke-virtual {v0}, Lcom/android/launcher3/widget/V0$b;->d()Lcom/android/launcher3/widget/U;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const/4 v4, 0x0

    .line 50
    if-nez v1, :cond_0

    .line 51
    .line 52
    invoke-virtual {p2, p1, v2}, Lz1/J3;->B(Lcom/android/launcher3/model/data/y;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    .line 54
    .line 55
    :goto_0
    sget-object p0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/android/launcher3/util/K2;->endSection()V

    .line 58
    .line 59
    .line 60
    return-object v4

    .line 61
    :cond_0
    if-eqz v3, :cond_1

    .line 62
    .line 63
    :try_start_1
    invoke-virtual {p2, p1}, Lz1/J3;->b0(Lcom/android/launcher3/model/data/y;)V

    .line 64
    .line 65
    .line 66
    :cond_1
    const/4 v2, 0x3

    .line 67
    if-ne v1, v2, :cond_2

    .line 68
    .line 69
    new-instance p2, Lcom/android/launcher3/widget/t0;

    .line 70
    .line 71
    iget-object v0, p0, Lcom/android/launcher3/util/B0;->a:Landroid/content/Context;

    .line 72
    .line 73
    invoke-direct {p2, v0}, Lcom/android/launcher3/widget/t0;-><init>(Landroid/content/Context;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, p2, p1}, Lcom/android/launcher3/util/B0;->g(Landroid/appwidget/AppWidgetHostView;Lcom/android/launcher3/model/data/A;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 77
    .line 78
    .line 79
    sget-object p0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/android/launcher3/util/K2;->endSection()V

    .line 82
    .line 83
    .line 84
    return-object p2

    .line 85
    :cond_2
    const/4 v2, 0x4

    .line 86
    if-ne v1, v2, :cond_3

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_3
    const/4 v2, 0x1

    .line 90
    if-eq v1, v2, :cond_5

    .line 91
    .line 92
    if-nez v0, :cond_4

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_4
    :try_start_2
    iget-object v1, p0, Lcom/android/launcher3/util/B0;->b:Lcom/android/launcher3/widget/l0;

    .line 96
    .line 97
    iget v3, p1, Lcom/android/launcher3/model/data/A;->g:I

    .line 98
    .line 99
    invoke-virtual {v1, v3, v0}, Lcom/android/launcher3/widget/l0;->v(ILcom/android/launcher3/widget/U;)Landroid/appwidget/AppWidgetHostView;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    goto :goto_2

    .line 104
    :cond_5
    :goto_1
    new-instance v1, Lcom/android/launcher3/widget/F0;

    .line 105
    .line 106
    iget-object v3, p0, Lcom/android/launcher3/util/B0;->a:Landroid/content/Context;

    .line 107
    .line 108
    iget-object v5, p0, Lcom/android/launcher3/util/B0;->b:Lcom/android/launcher3/widget/l0;

    .line 109
    .line 110
    invoke-direct {v1, v3, v5, p1, v0}, Lcom/android/launcher3/widget/F0;-><init>(Landroid/content/Context;Lcom/android/launcher3/widget/l0;Lcom/android/launcher3/model/data/A;Lcom/android/launcher3/widget/U;)V

    .line 111
    .line 112
    .line 113
    :goto_2
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    if-eqz v0, :cond_6

    .line 117
    .line 118
    iget-object v3, p0, Lcom/android/launcher3/util/B0;->a:Landroid/content/Context;

    .line 119
    .line 120
    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    invoke-virtual {v0, v3}, Landroid/appwidget/AppWidgetProviderInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iput-object v0, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 129
    .line 130
    :cond_6
    invoke-virtual {p0, v1, p1}, Lcom/android/launcher3/util/B0;->g(Landroid/appwidget/AppWidgetHostView;Lcom/android/launcher3/model/data/A;)V

    .line 131
    .line 132
    .line 133
    instance-of p0, v1, Lcom/android/launcher3/widget/F0;

    .line 134
    .line 135
    if-eqz p0, :cond_7

    .line 136
    .line 137
    move-object p0, v1

    .line 138
    check-cast p0, Lcom/android/launcher3/widget/F0;

    .line 139
    .line 140
    invoke-virtual {p0}, Lcom/android/launcher3/widget/F0;->h0()Z

    .line 141
    .line 142
    .line 143
    move-result p0

    .line 144
    if-eqz p0, :cond_7

    .line 145
    .line 146
    invoke-virtual {p1, v2}, Lcom/android/launcher3/model/data/A;->y(I)Z

    .line 147
    .line 148
    .line 149
    move-result p0

    .line 150
    if-nez p0, :cond_7

    .line 151
    .line 152
    const-string p0, "Launcher"

    .line 153
    .line 154
    const-string v0, "inflateAppWidget: delete this Widget because it is a restored config Widget"

    .line 155
    .line 156
    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    const-string p0, "delete this Widget because it is a restored config Widget"

    .line 160
    .line 161
    invoke-virtual {p2, p1, p0}, Lz1/J3;->B(Lcom/android/launcher3/model/data/y;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 162
    .line 163
    .line 164
    goto :goto_0

    .line 165
    :cond_7
    sget-object p0, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 166
    .line 167
    invoke-virtual {p0}, Lcom/android/launcher3/util/K2;->endSection()V

    .line 168
    .line 169
    .line 170
    return-object v1

    .line 171
    :catchall_0
    move-exception p0

    .line 172
    sget-object p1, Lcom/android/launcher3/util/K2;->INSTANCE:Lcom/android/launcher3/util/K2;

    .line 173
    .line 174
    invoke-virtual {p1}, Lcom/android/launcher3/util/K2;->endSection()V

    .line 175
    .line 176
    .line 177
    throw p0
.end method

.method public static synthetic e(Lcom/android/launcher3/util/B0;Lcom/android/launcher3/model/data/y;Lz1/J3;Landroid/view/ViewGroup;ILjava/lang/Object;)Landroid/view/View;
    .locals 0

    .line 1
    and-int/lit8 p4, p4, 0x4

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    const/4 p3, 0x0

    .line 6
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/util/B0;->d(Lcom/android/launcher3/model/data/y;Lz1/J3;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method


# virtual methods
.method public final a(Lcom/android/launcher3/model/data/I;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    const-string v0, "info"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "parent"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const v1, 0x7f0e006d

    .line 20
    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-virtual {v0, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    const-string v0, "null cannot be cast to non-null type com.android.launcher3.BubbleTextView"

    .line 28
    .line 29
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    check-cast p2, Lcom/android/launcher3/BubbleTextView;

    .line 33
    .line 34
    invoke-virtual {p2, p1}, Lcom/android/launcher3/BubbleTextView;->y(Lcom/android/launcher3/model/data/I;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/android/launcher3/util/B0;->c:Landroid/view/View$OnClickListener;

    .line 38
    .line 39
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/android/launcher3/util/B0;->d:Landroid/view/View$OnFocusChangeListener;

    .line 43
    .line 44
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 45
    .line 46
    .line 47
    return-object p2
.end method

.method public final c(Lcom/android/launcher3/model/data/y;Lz1/J3;)Landroid/view/View;
    .locals 7

    .line 1
    const-string v0, "item"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "writer"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 v5, 0x4

    .line 12
    const/4 v6, 0x0

    .line 13
    const/4 v4, 0x0

    .line 14
    move-object v1, p0

    .line 15
    move-object v2, p1

    .line 16
    move-object v3, p2

    .line 17
    invoke-static/range {v1 .. v6}, Lcom/android/launcher3/util/B0;->e(Lcom/android/launcher3/util/B0;Lcom/android/launcher3/model/data/y;Lz1/J3;Landroid/view/ViewGroup;ILjava/lang/Object;)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public final d(Lcom/android/launcher3/model/data/y;Lz1/J3;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    const-string v0, "item"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "writer"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    if-nez p3, :cond_0

    .line 12
    .line 13
    iget-object p3, p0, Lcom/android/launcher3/util/B0;->e:Landroid/view/ViewGroup;

    .line 14
    .line 15
    :cond_0
    iget v0, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 16
    .line 17
    if-eqz v0, :cond_6

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    if-eq v0, v1, :cond_6

    .line 21
    .line 22
    const/4 v1, 0x2

    .line 23
    if-eq v0, v1, :cond_3

    .line 24
    .line 25
    const/4 v1, 0x4

    .line 26
    if-eq v0, v1, :cond_2

    .line 27
    .line 28
    const/4 v1, 0x5

    .line 29
    if-eq v0, v1, :cond_2

    .line 30
    .line 31
    const/4 p2, 0x6

    .line 32
    if-eq v0, p2, :cond_6

    .line 33
    .line 34
    const/16 p2, 0x9

    .line 35
    .line 36
    if-eq v0, p2, :cond_6

    .line 37
    .line 38
    const/16 p2, 0xa

    .line 39
    .line 40
    if-ne v0, p2, :cond_1

    .line 41
    .line 42
    iget-object p0, p0, Lcom/android/launcher3/util/B0;->a:Landroid/content/Context;

    .line 43
    .line 44
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 45
    .line 46
    check-cast p1, Lcom/android/launcher3/model/data/l;

    .line 47
    .line 48
    const/4 p2, 0x0

    .line 49
    const v0, 0x7f0e006e

    .line 50
    .line 51
    .line 52
    invoke-static {v0, p0, p3, p1, p2}, Lcom/android/launcher3/apppairs/AppPairIcon;->c(ILcom/android/launcher3/views/k;Landroid/view/ViewGroup;Lcom/android/launcher3/model/data/l;I)Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0

    .line 57
    :cond_1
    new-instance p0, Ljava/lang/RuntimeException;

    .line 58
    .line 59
    new-instance p2, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 62
    .line 63
    .line 64
    const-string p3, "Invalid Item Type, info: "

    .line 65
    .line 66
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    throw p0

    .line 80
    :cond_2
    check-cast p1, Lcom/android/launcher3/model/data/A;

    .line 81
    .line 82
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/util/B0;->b(Lcom/android/launcher3/model/data/A;Lz1/J3;)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0

    .line 87
    :cond_3
    check-cast p1, Lcom/android/launcher3/model/data/p;

    .line 88
    .line 89
    const/16 p2, 0x8

    .line 90
    .line 91
    invoke-virtual {p1, p2}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    const v0, 0x7f0e00e0

    .line 96
    .line 97
    .line 98
    if-eqz p2, :cond_4

    .line 99
    .line 100
    const-string p2, "Launcher"

    .line 101
    .line 102
    const-string v1, "bindItems--hideAppFolderIcon"

    .line 103
    .line 104
    invoke-static {p2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    .line 106
    .line 107
    iget-object p0, p0, Lcom/android/launcher3/util/B0;->a:Landroid/content/Context;

    .line 108
    .line 109
    invoke-static {v0, p0, p3, p1}, Lcom/android/launcher3/folder/FolderIcon;->K(ILandroid/content/Context;Landroid/view/ViewGroup;Lcom/android/launcher3/model/data/p;)Lcom/android/launcher3/folder/FolderIcon;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    return-object p0

    .line 114
    :cond_4
    iget-object p2, p0, Lcom/android/launcher3/util/B0;->a:Landroid/content/Context;

    .line 115
    .line 116
    check-cast p2, Lcom/android/launcher3/views/k;

    .line 117
    .line 118
    invoke-interface {p2}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    iget-boolean p2, p2, Lcom/android/launcher3/X3;->B0:Z

    .line 123
    .line 124
    if-eqz p2, :cond_5

    .line 125
    .line 126
    const v0, 0x7f0e0246

    .line 127
    .line 128
    .line 129
    :cond_5
    iget-object p0, p0, Lcom/android/launcher3/util/B0;->a:Landroid/content/Context;

    .line 130
    .line 131
    invoke-static {v0, p0, p3, p1}, Lcom/android/launcher3/folder/FolderIcon;->K(ILandroid/content/Context;Landroid/view/ViewGroup;Lcom/android/launcher3/model/data/p;)Lcom/android/launcher3/folder/FolderIcon;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    return-object p0

    .line 136
    :cond_6
    instance-of p2, p1, Lcom/android/launcher3/model/data/F;

    .line 137
    .line 138
    if-eqz p2, :cond_7

    .line 139
    .line 140
    move-object p2, p1

    .line 141
    check-cast p2, Lcom/android/launcher3/model/data/F;

    .line 142
    .line 143
    iget-object v0, p0, Lcom/android/launcher3/util/B0;->a:Landroid/content/Context;

    .line 144
    .line 145
    invoke-interface {p2, v0}, Lcom/android/launcher3/model/data/F;->a(Landroid/content/Context;)Lcom/android/launcher3/model/data/I;

    .line 146
    .line 147
    .line 148
    move-result-object p2

    .line 149
    goto :goto_0

    .line 150
    :cond_7
    move-object p2, p1

    .line 151
    check-cast p2, Lcom/android/launcher3/model/data/I;

    .line 152
    .line 153
    :goto_0
    iget v0, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 154
    .line 155
    const/16 v1, -0x66

    .line 156
    .line 157
    if-ne v0, v1, :cond_8

    .line 158
    .line 159
    new-instance v0, Lcom/android/launcher3/model/data/I;

    .line 160
    .line 161
    invoke-direct {v0, p2}, Lcom/android/launcher3/model/data/I;-><init>(Lcom/android/launcher3/model/data/I;)V

    .line 162
    .line 163
    .line 164
    move-object p2, v0

    .line 165
    :cond_8
    invoke-static {p2}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {p0, p2, p3}, Lcom/android/launcher3/util/B0;->a(Lcom/android/launcher3/model/data/I;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 169
    .line 170
    .line 171
    move-result-object p2

    .line 172
    invoke-static {}, Lx1/O;->k0()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p3

    .line 176
    new-instance v0, Ljava/lang/StringBuilder;

    .line 177
    .line 178
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 179
    .line 180
    .line 181
    const-string v1, "_"

    .line 182
    .line 183
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p3

    .line 193
    const-string v0, "_gen_nubia_cn"

    .line 194
    .line 195
    invoke-static {v0, p3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 196
    .line 197
    .line 198
    move-result p3

    .line 199
    if-eqz p3, :cond_9

    .line 200
    .line 201
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object p3

    .line 205
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    invoke-static {p3, v0}, Lx1/S;->m(Ljava/lang/String;Landroid/content/ComponentName;)Z

    .line 210
    .line 211
    .line 212
    move-result p3

    .line 213
    if-eqz p3, :cond_9

    .line 214
    .line 215
    iget-object p0, p0, Lcom/android/launcher3/util/B0;->a:Landroid/content/Context;

    .line 216
    .line 217
    invoke-static {p0, p1, p2}, Lx1/S;->b(Landroid/content/Context;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 218
    .line 219
    .line 220
    :cond_9
    return-object p2
.end method

.method public final f(Lcom/android/launcher3/model/data/A;Lz1/J3;)Landroid/view/View;
    .locals 1

    .line 1
    const-string v0, "item"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "writer"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/util/B0;->b(Lcom/android/launcher3/model/data/A;Lz1/J3;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final g(Landroid/appwidget/AppWidgetHostView;Lcom/android/launcher3/model/data/A;)V
    .locals 1

    .line 1
    const-string v0, "hostView"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "item"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, p2}, Landroid/appwidget/AppWidgetHostView;->setTag(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    const/4 p2, 0x1

    .line 15
    invoke-virtual {p1, p2}, Landroid/appwidget/AppWidgetHostView;->setFocusable(Z)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/android/launcher3/util/B0;->d:Landroid/view/View$OnFocusChangeListener;

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Landroid/appwidget/AppWidgetHostView;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
