.class public Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;
.super Lcom/android/launcher3/widget/custom/ai/r;
.source "AICustomWidgetBottomEventLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;,
        Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;
    }
.end annotation


# static fields
.field private static final v:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final w:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;",
            "Ljava/lang/Class<",
            "+",
            "Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private j:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;

.field private k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;",
            ">;"
        }
    .end annotation
.end field

.field private l:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;",
            ">;"
        }
    .end annotation
.end field

.field private m:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;

.field private n:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;",
            ">;"
        }
    .end annotation
.end field

.field private o:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;",
            ">;"
        }
    .end annotation
.end field

.field private p:Ljava/lang/String;

.field private q:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;",
            ">;"
        }
    .end annotation
.end field

.field private r:I

.field private s:I

.field private t:Lcom/android/launcher3/widget/custom/ai/r$a;

.field private u:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-string v0, "unsign"

    .line 2
    .line 3
    const-string v1, "recentSign"

    .line 4
    .line 5
    const-string v2, "toTake"

    .line 6
    .line 7
    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->v:Ljava/util/List;

    .line 16
    .line 17
    new-instance v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$c;

    .line 18
    .line 19
    invoke-direct {v0}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$c;-><init>()V

    .line 20
    .line 21
    .line 22
    sput-object v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->w:Ljava/util/HashMap;

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/widget/custom/ai/r;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->k:Ljava/util/ArrayList;

    .line 4
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->l:Ljava/util/ArrayList;

    .line 5
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->n:Ljava/util/ArrayList;

    .line 6
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->o:Ljava/util/ArrayList;

    .line 7
    const-string p1, ""

    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->p:Ljava/lang/String;

    .line 8
    new-instance p1, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$a;

    invoke-direct {p1, p0}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$a;-><init>(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;)V

    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->q:Ljava/util/Comparator;

    const/4 p1, 0x0

    .line 9
    iput p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->r:I

    .line 10
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f070098

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result p1

    iput p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->s:I

    .line 11
    new-instance p1, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$b;

    invoke-direct {p1, p0}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$b;-><init>(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;)V

    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->t:Lcom/android/launcher3/widget/custom/ai/r$a;

    .line 12
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->u:Ljava/util/HashMap;

    return-void
.end method

.method private static A(Landroid/content/Context;Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;)Landroid/util/Pair;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;",
            ")",
            "Landroid/util/Pair<",
            "Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->q(Ljava/lang/Object;)Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz p1, :cond_3

    .line 6
    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    sget-object v1, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;->k:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;

    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :cond_0
    invoke-static {p0, v0}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->y(Landroid/content/Context;Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;)Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v2, Lcom/google/gson/f;

    .line 20
    .line 21
    invoke-direct {v2}, Lcom/google/gson/f;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2, p1}, Lcom/google/gson/f;->s(Ljava/lang/Object;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    :cond_1
    const/4 v2, 0x0

    .line 38
    invoke-virtual {v1, v2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    const/16 v3, 0x32

    .line 46
    .line 47
    if-le p1, v3, :cond_2

    .line 48
    .line 49
    new-instance p1, Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-virtual {v1, v2, v3}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-direct {p1, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 56
    .line 57
    .line 58
    move-object v1, p1

    .line 59
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 62
    .line 63
    .line 64
    const-string v3, "syncSaveClickHistory dataType="

    .line 65
    .line 66
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v3, " size="

    .line 73
    .line 74
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    const-string v3, "AICustomWidgetBottomEventLayout"

    .line 89
    .line 90
    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    new-instance p1, Lcom/google/gson/f;

    .line 94
    .line 95
    invoke-direct {p1}, Lcom/google/gson/f;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1, v1}, Lcom/google/gson/f;->s(Ljava/lang/Object;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    new-instance v3, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 105
    .line 106
    .line 107
    const-string v4, "click_history_prefix"

    .line 108
    .line 109
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    new-instance v4, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const-string v5, ""

    .line 121
    .line 122
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v4

    .line 129
    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 130
    .line 131
    invoke-virtual {v4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v4

    .line 135
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    const-string v4, "ai_custom_widget_bottom_event_prefs"

    .line 143
    .line 144
    invoke-virtual {p0, v4, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-interface {p0, v3, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 157
    .line 158
    .line 159
    new-instance p0, Landroid/util/Pair;

    .line 160
    .line 161
    invoke-static {v0, v1}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->p(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-direct {p0, v0, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 166
    .line 167
    .line 168
    return-object p0

    .line 169
    :cond_3
    :goto_0
    const/4 p0, 0x0

    .line 170
    return-object p0
.end method

.method public static synthetic d(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->v(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;Ljava/util/HashMap;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->u(Ljava/util/HashMap;Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;Landroid/content/Context;Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->t(Landroid/content/Context;Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;Landroid/view/View;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->s(Landroid/view/View;Landroid/util/Pair;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->r(Landroid/util/Pair;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;)Z
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->isAvailable()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    const-string v0, "hotel"

    .line 10
    .line 11
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->dataKeyString:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v0, v2

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    :goto_0
    move v0, v1

    .line 23
    :goto_1
    if-nez v0, :cond_3

    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->fromTime:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0, v2}, Lcom/android/launcher3/widget/custom/ai/n;->I(Ljava/lang/String;Z)J

    .line 28
    .line 29
    .line 30
    move-result-wide v3

    .line 31
    const-wide/16 v5, 0x0

    .line 32
    .line 33
    cmp-long v0, v3, v5

    .line 34
    .line 35
    if-lez v0, :cond_2

    .line 36
    .line 37
    invoke-static {v3, v4}, Lcom/android/launcher3/widget/custom/ai/n;->T(J)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_2

    .line 42
    .line 43
    goto :goto_2

    .line 44
    :cond_2
    move v1, v2

    .line 45
    :goto_2
    move v0, v1

    .line 46
    :cond_3
    if-eqz v0, :cond_4

    .line 47
    .line 48
    new-instance v1, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .line 52
    .line 53
    const-string v2, "updateViewsByTravelData remove travelData="

    .line 54
    .line 55
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    new-instance v2, Lcom/google/gson/f;

    .line 59
    .line 60
    invoke-direct {v2}, Lcom/google/gson/f;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v2, p0}, Lcom/google/gson/f;->s(Ljava/lang/Object;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const-string v1, "AICustomWidgetBottomEventLayout"

    .line 75
    .line 76
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    :cond_4
    return v0
.end method

.method public static synthetic j(Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;)Z
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public static synthetic k(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic l(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->w(Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic m(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->o:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic n(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->x(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic o(Ljava/lang/Object;)Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->q(Ljava/lang/Object;)Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static p(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;",
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
    if-eqz p1, :cond_2

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_2

    .line 13
    .line 14
    sget-object v1, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->w:Ljava/util/HashMap;

    .line 15
    .line 16
    invoke-virtual {v1, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-nez v2, :cond_1

    .line 44
    .line 45
    new-instance v2, Lcom/google/gson/f;

    .line 46
    .line 47
    invoke-direct {v2}, Lcom/google/gson/f;-><init>()V

    .line 48
    .line 49
    .line 50
    sget-object v3, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->w:Ljava/util/HashMap;

    .line 51
    .line 52
    invoke-virtual {v3, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    check-cast v3, Ljava/lang/Class;

    .line 57
    .line 58
    invoke-virtual {v2, v1, v3}, Lcom/google/gson/f;->j(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    check-cast v1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;

    .line 63
    .line 64
    if-eqz v1, :cond_1

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :catchall_0
    move-exception p0

    .line 71
    const-string p1, "AICustomWidgetBottomEventLayout"

    .line 72
    .line 73
    const-string v1, "getDataListByClickHistoryStrList error"

    .line 74
    .line 75
    invoke-static {p1, v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 76
    .line 77
    .line 78
    :cond_2
    :goto_1
    return-object v0
.end method

.method private static q(Ljava/lang/Object;)Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;->h:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    instance-of v0, p0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    sget-object p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;->i:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    instance-of p0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;

    .line 16
    .line 17
    if-eqz p0, :cond_2

    .line 18
    .line 19
    sget-object p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;->g:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_2
    sget-object p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;->k:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;

    .line 23
    .line 24
    return-object p0
.end method

.method private synthetic r(Landroid/util/Pair;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->u:Ljava/util/HashMap;

    .line 12
    .line 13
    check-cast v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;

    .line 14
    .line 15
    check-cast p1, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {v1, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->B(Z)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method private synthetic s(Landroid/view/View;Landroid/util/Pair;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/android/launcher3/widget/custom/ai/i;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2}, Lcom/android/launcher3/widget/custom/ai/i;-><init>(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;Landroid/util/Pair;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0x1f4

    .line 7
    .line 8
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic t(Landroid/content/Context;Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p1, p2}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->A(Landroid/content/Context;Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object p2, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 6
    .line 7
    new-instance v0, Lcom/android/launcher3/widget/custom/ai/h;

    .line 8
    .line 9
    invoke-direct {v0, p0, p3, p1}, Lcom/android/launcher3/widget/custom/ai/h;-><init>(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;Landroid/view/View;Landroid/util/Pair;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private synthetic u(Ljava/util/HashMap;Landroid/content/Context;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->u:Ljava/util/HashMap;

    .line 2
    .line 3
    sget-object p1, Lcom/android/launcher3/widget/custom/ai/n;->v:Lcom/android/launcher3/util/I;

    .line 4
    .line 5
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/android/launcher3/widget/custom/ai/n;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->j:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v2, v1}, Lcom/android/launcher3/widget/custom/ai/n;->v(ZLcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/android/launcher3/widget/custom/ai/n;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->j:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;

    .line 24
    .line 25
    invoke-virtual {v0, v2, v1}, Lcom/android/launcher3/widget/custom/ai/n;->w(ZLcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Lcom/android/launcher3/widget/custom/ai/n;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->j:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;

    .line 35
    .line 36
    invoke-virtual {p1, v2, p0}, Lcom/android/launcher3/widget/custom/ai/n;->B(ZLcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private synthetic v(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->z(Landroid/content/Context;)Ljava/util/HashMap;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 6
    .line 7
    new-instance v2, Lcom/android/launcher3/widget/custom/ai/d;

    .line 8
    .line 9
    invoke-direct {v2, p0, v0, p1}, Lcom/android/launcher3/widget/custom/ai/d;-><init>(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;Ljava/util/HashMap;Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private synthetic w(Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;)Z
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_2

    .line 9
    .line 10
    move-object v1, p1

    .line 11
    check-cast v1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;->fromTime:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v1, v2}, Lcom/android/launcher3/widget/custom/ai/n;->I(Ljava/lang/String;Z)J

    .line 16
    .line 17
    .line 18
    move-result-wide v3

    .line 19
    const-wide/16 v5, 0x0

    .line 20
    .line 21
    cmp-long v1, v3, v5

    .line 22
    .line 23
    if-lez v1, :cond_1

    .line 24
    .line 25
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 26
    .line 27
    .line 28
    move-result-wide v5

    .line 29
    cmp-long v1, v5, v3

    .line 30
    .line 31
    if-lez v1, :cond_4

    .line 32
    .line 33
    :cond_1
    :goto_0
    move v1, v0

    .line 34
    goto :goto_2

    .line 35
    :cond_2
    instance-of v1, p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;

    .line 36
    .line 37
    if-eqz v1, :cond_3

    .line 38
    .line 39
    move-object v1, p1

    .line 40
    check-cast v1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->isAllDay()Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-nez v3, :cond_4

    .line 47
    .line 48
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 49
    .line 50
    .line 51
    move-result-wide v3

    .line 52
    invoke-virtual {v1}, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;->getEndTimeLong()J

    .line 53
    .line 54
    .line 55
    move-result-wide v5

    .line 56
    cmp-long v1, v3, v5

    .line 57
    .line 58
    if-lez v1, :cond_4

    .line 59
    .line 60
    :goto_1
    goto :goto_0

    .line 61
    :cond_3
    instance-of v1, p1, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;

    .line 62
    .line 63
    if-eqz v1, :cond_4

    .line 64
    .line 65
    move-object v1, p1

    .line 66
    check-cast v1, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;

    .line 67
    .line 68
    invoke-static {v1}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;->a(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;)I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-gtz v1, :cond_4

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_4
    move v1, v2

    .line 76
    :goto_2
    const-string v3, "AICustomWidgetBottomEventLayout"

    .line 77
    .line 78
    if-eqz v1, :cond_5

    .line 79
    .line 80
    new-instance v4, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 83
    .line 84
    .line 85
    const-string v5, "updateViews remove bottomEventData status not right, bottomEventData="

    .line 86
    .line 87
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    .line 99
    .line 100
    :cond_5
    if-nez v1, :cond_8

    .line 101
    .line 102
    invoke-static {p1}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->q(Ljava/lang/Object;)Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    iget-object v4, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->u:Ljava/util/HashMap;

    .line 107
    .line 108
    invoke-virtual {v4, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    if-eqz v4, :cond_6

    .line 113
    .line 114
    iget-object v4, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->u:Ljava/util/HashMap;

    .line 115
    .line 116
    invoke-virtual {v4, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    if-eqz v4, :cond_6

    .line 121
    .line 122
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->u:Ljava/util/HashMap;

    .line 123
    .line 124
    invoke-virtual {p0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    check-cast p0, Ljava/util/ArrayList;

    .line 129
    .line 130
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    if-eqz p0, :cond_6

    .line 135
    .line 136
    goto :goto_3

    .line 137
    :cond_6
    move v0, v2

    .line 138
    :goto_3
    if-eqz v0, :cond_7

    .line 139
    .line 140
    new-instance p0, Ljava/lang/StringBuilder;

    .line 141
    .line 142
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 143
    .line 144
    .line 145
    const-string v1, "updateViews remove bottomEventData in click history, bottomEventData="

    .line 146
    .line 147
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    invoke-static {v3, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    .line 159
    .line 160
    :cond_7
    return v0

    .line 161
    :cond_8
    return v1
.end method

.method private x(Landroid/view/View;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-static {v0}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->q(Ljava/lang/Object;)Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v2, 0x0

    .line 15
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v4, "onCardClick dataType="

    .line 21
    .line 22
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v4, " tag="

    .line 29
    .line 30
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    const-string v4, "AICustomWidgetBottomEventLayout"

    .line 45
    .line 46
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    instance-of v3, v0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;

    .line 50
    .line 51
    if-eqz v3, :cond_1

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    move-object v4, v0

    .line 58
    check-cast v4, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;

    .line 59
    .line 60
    invoke-static {v3, v4}, Lcom/android/launcher3/widget/custom/ai/n;->U(Landroid/content/Context;Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;)V

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_1
    instance-of v3, v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;

    .line 65
    .line 66
    if-eqz v3, :cond_2

    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-static {v3}, Lcom/android/launcher3/widget/custom/ai/n;->b0(Landroid/content/Context;)V

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_2
    instance-of v3, v0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;

    .line 77
    .line 78
    if-eqz v3, :cond_3

    .line 79
    .line 80
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    invoke-static {v3}, Lcom/android/launcher3/widget/custom/ai/n;->a0(Landroid/content/Context;)V

    .line 85
    .line 86
    .line 87
    :cond_3
    :goto_1
    if-eqz v1, :cond_5

    .line 88
    .line 89
    if-nez v2, :cond_4

    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    check-cast v0, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;

    .line 101
    .line 102
    sget-object v2, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 103
    .line 104
    new-instance v3, Lcom/android/launcher3/widget/custom/ai/f;

    .line 105
    .line 106
    invoke-direct {v3, p0, v1, v0, p1}, Lcom/android/launcher3/widget/custom/ai/f;-><init>(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;Landroid/content/Context;Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;Landroid/view/View;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v2, v3}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 110
    .line 111
    .line 112
    :cond_5
    :goto_2
    return-void
.end method

.method private static y(Landroid/content/Context;Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;",
            ")",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "click_history_prefix"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p1, ""

    .line 20
    .line 21
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-string v1, "ai_custom_widget_bottom_event_prefs"

    .line 42
    .line 43
    const/4 v2, 0x0

    .line 44
    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-nez p1, :cond_0

    .line 57
    .line 58
    :try_start_0
    new-instance p1, Lcom/google/gson/f;

    .line 59
    .line 60
    invoke-direct {p1}, Lcom/google/gson/f;-><init>()V

    .line 61
    .line 62
    .line 63
    new-instance v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$d;

    .line 64
    .line 65
    invoke-direct {v0}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$d;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/google/gson/reflect/a;->getType()Ljava/lang/reflect/Type;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p1, p0, v0}, Lcom/google/gson/f;->k(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    check-cast p0, Ljava/util/ArrayList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :catchall_0
    move-exception p0

    .line 80
    const-string p1, "AICustomWidgetBottomEventLayout"

    .line 81
    .line 82
    const-string v0, "syncGetSavedClickHistory error"

    .line 83
    .line 84
    invoke-static {p1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 85
    .line 86
    .line 87
    :cond_0
    const/4 p0, 0x0

    .line 88
    :goto_0
    if-nez p0, :cond_1

    .line 89
    .line 90
    new-instance p0, Ljava/util/ArrayList;

    .line 91
    .line 92
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 93
    .line 94
    .line 95
    :cond_1
    new-instance p1, Lcom/android/launcher3/widget/custom/ai/e;

    .line 96
    .line 97
    invoke-direct {p1}, Lcom/android/launcher3/widget/custom/ai/e;-><init>()V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    .line 101
    .line 102
    .line 103
    return-object p0
.end method

.method private static z(Landroid/content/Context;)Ljava/util/HashMap;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/HashMap<",
            "Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->w:Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;

    .line 27
    .line 28
    :try_start_0
    invoke-static {p0, v2}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->y(Landroid/content/Context;Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;)Ljava/util/ArrayList;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-static {v2, v3}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->p(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception v2

    .line 41
    const-string v3, "AICustomWidgetBottomEventLayout"

    .line 42
    .line 43
    const-string v4, "syncInitClickHistoryMap error"

    .line 44
    .line 45
    invoke-static {v3, v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    return-object v0
.end method


# virtual methods
.method protected B(Z)V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/launcher3/widget/custom/ai/n;->E:Ljava/text/SimpleDateFormat;

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->p:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->p:Ljava/lang/String;

    .line 27
    .line 28
    new-instance p1, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->l:Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->k:Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->m:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    new-instance v0, Lcom/android/launcher3/widget/custom/ai/b;

    .line 49
    .line 50
    invoke-direct {v0}, Lcom/android/launcher3/widget/custom/ai/b;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->o:Ljava/util/ArrayList;

    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_1

    .line 69
    .line 70
    const-string p0, "AICustomWidgetBottomEventLayout"

    .line 71
    .line 72
    const-string p1, "updateViews before and after all empty return"

    .line 73
    .line 74
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->n:Ljava/util/ArrayList;

    .line 79
    .line 80
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->n:Ljava/util/ArrayList;

    .line 84
    .line 85
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 86
    .line 87
    .line 88
    new-instance v0, Lcom/android/launcher3/widget/custom/ai/c;

    .line 89
    .line 90
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/custom/ai/c;-><init>(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->q:Ljava/util/Comparator;

    .line 97
    .line 98
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->sort(Ljava/util/Comparator;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->o:Ljava/util/ArrayList;

    .line 102
    .line 103
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->o:Ljava/util/ArrayList;

    .line 107
    .line 108
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    const/4 v2, 0x3

    .line 113
    if-le v1, v2, :cond_2

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_2
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 117
    .line 118
    .line 119
    move-result v2

    .line 120
    :goto_0
    const/4 v1, 0x0

    .line 121
    invoke-virtual {p1, v1, v2}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 126
    .line 127
    .line 128
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->o:Ljava/util/ArrayList;

    .line 129
    .line 130
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    if-lez p1, :cond_3

    .line 135
    .line 136
    goto :goto_1

    .line 137
    :cond_3
    const/4 v1, 0x4

    .line 138
    :goto_1
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p0}, Lcom/android/launcher3/widget/custom/ai/r;->b()V

    .line 142
    .line 143
    .line 144
    return-void
.end method

.method protected C(Lcom/android/launcher3/widget/custom/ai/data/AIWidgetExpressResult;)V
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "updateViewsByExpressData aiWidgetExpressResult="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    new-instance v1, Lcom/google/gson/f;

    .line 12
    .line 13
    invoke-direct {v1}, Lcom/google/gson/f;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, p1}, Lcom/google/gson/f;->s(Ljava/lang/Object;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "AICustomWidgetBottomEventLayout"

    .line 28
    .line 29
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 38
    .line 39
    .line 40
    iget-object v1, p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetExpressResult;->statusMap:Ljava/util/HashMap;

    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    const-string v3, ""

    .line 44
    .line 45
    if-eqz v1, :cond_4

    .line 46
    .line 47
    sget-object v1, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->v:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    move v4, v2

    .line 54
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    if-eqz v5, :cond_3

    .line 59
    .line 60
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    check-cast v5, Ljava/lang/String;

    .line 65
    .line 66
    const-string v6, "recentSign"

    .line 67
    .line 68
    invoke-virtual {v6, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result v6

    .line 72
    if-nez v6, :cond_1

    .line 73
    .line 74
    iget-object v6, p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetExpressResult;->statusMap:Ljava/util/HashMap;

    .line 75
    .line 76
    invoke-virtual {v6, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v6

    .line 80
    if-eqz v6, :cond_1

    .line 81
    .line 82
    iget-object v4, p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetExpressResult;->statusMap:Ljava/util/HashMap;

    .line 83
    .line 84
    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    if-eqz v4, :cond_2

    .line 89
    .line 90
    iget-object v4, p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetExpressResult;->statusMap:Ljava/util/HashMap;

    .line 91
    .line 92
    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    check-cast v4, Ljava/util/ArrayList;

    .line 97
    .line 98
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    goto :goto_0

    .line 103
    :cond_2
    move v4, v2

    .line 104
    :goto_0
    if-lez v4, :cond_1

    .line 105
    .line 106
    iget-object v1, p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetExpressResult;->statusMap:Ljava/util/HashMap;

    .line 107
    .line 108
    invoke-virtual {v1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    check-cast v1, Ljava/util/ArrayList;

    .line 113
    .line 114
    invoke-virtual {v0, v5, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move v2, v4

    .line 118
    move-object v3, v5

    .line 119
    goto :goto_1

    .line 120
    :cond_3
    move v2, v4

    .line 121
    :cond_4
    :goto_1
    const/4 v1, 0x0

    .line 122
    if-lez v2, :cond_6

    .line 123
    .line 124
    new-instance v4, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;

    .line 125
    .line 126
    invoke-direct {v4, v1}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;-><init>(Lcom/android/launcher3/widget/custom/ai/k;)V

    .line 127
    .line 128
    .line 129
    invoke-static {v4, v2}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;->c(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;I)V

    .line 130
    .line 131
    .line 132
    invoke-static {v4, v0}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;->d(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;Ljava/util/HashMap;)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetExpressResult;->statusWordingMap:Ljava/util/HashMap;

    .line 136
    .line 137
    if-eqz v0, :cond_5

    .line 138
    .line 139
    invoke-virtual {v0, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_5

    .line 144
    .line 145
    iget-object p1, p1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetExpressResult;->statusWordingMap:Ljava/util/HashMap;

    .line 146
    .line 147
    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    check-cast p1, Ljava/lang/String;

    .line 152
    .line 153
    invoke-static {v4, p1}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;->e(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    :cond_5
    move-object v1, v4

    .line 157
    :cond_6
    iput-object v1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->m:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;

    .line 158
    .line 159
    const/4 p1, 0x1

    .line 160
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->B(Z)V

    .line 161
    .line 162
    .line 163
    return-void
.end method

.method protected D(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "updateViewsByToDoListData todoListData.size="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v1, 0x0

    .line 23
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "AICustomWidgetBottomEventLayout"

    .line 31
    .line 32
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    sget-boolean v0, Lcom/android/launcher3/widget/custom/ai/n;->u:Z

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    const-string v2, "updateViewsByToDoListData todoListData="

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    new-instance v2, Lcom/google/gson/f;

    .line 50
    .line 51
    invoke-direct {v2}, Lcom/google/gson/f;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2, p1}, Lcom/google/gson/f;->s(Ljava/lang/Object;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    :cond_1
    if-nez p1, :cond_2

    .line 69
    .line 70
    return-void

    .line 71
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->k:Ljava/util/ArrayList;

    .line 72
    .line 73
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->k:Ljava/util/ArrayList;

    .line 77
    .line 78
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 79
    .line 80
    .line 81
    const/4 p1, 0x1

    .line 82
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->B(Z)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method protected E(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "updateViewsByTravelData travelDataList.size="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v1, 0x0

    .line 23
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "AICustomWidgetBottomEventLayout"

    .line 31
    .line 32
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    sget-boolean v0, Lcom/android/launcher3/widget/custom/ai/n;->u:Z

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    const-string v2, "updateViewsByTravelData travelDataList="

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    new-instance v2, Lcom/google/gson/f;

    .line 50
    .line 51
    invoke-direct {v2}, Lcom/google/gson/f;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2, p1}, Lcom/google/gson/f;->s(Ljava/lang/Object;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    :cond_1
    if-nez p1, :cond_2

    .line 69
    .line 70
    return-void

    .line 71
    :cond_2
    new-instance v0, Lcom/android/launcher3/widget/custom/ai/g;

    .line 72
    .line 73
    invoke-direct {v0}, Lcom/android/launcher3/widget/custom/ai/g;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->l:Ljava/util/ArrayList;

    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->l:Ljava/util/ArrayList;

    .line 85
    .line 86
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 87
    .line 88
    .line 89
    const/4 p1, 0x1

    .line 90
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->B(Z)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/widget/custom/ai/r;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->t:Lcom/android/launcher3/widget/custom/ai/r$a;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/android/launcher3/widget/custom/ai/r;->setCustomCardContainerCallback(Lcom/android/launcher3/widget/custom/ai/r$a;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingLeft()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingTop()I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    const/4 p3, 0x0

    .line 20
    :goto_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 21
    .line 22
    .line 23
    move-result p4

    .line 24
    if-ge p3, p4, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0, p3}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p4

    .line 30
    new-instance p5, Landroid/graphics/Rect;

    .line 31
    .line 32
    invoke-virtual {p4}, Landroid/view/View;->getMeasuredWidth()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    add-int/2addr v0, p1

    .line 37
    invoke-virtual {p4}, Landroid/view/View;->getMeasuredHeight()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    add-int/2addr v1, p2

    .line 42
    invoke-direct {p5, p1, p2, v0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 43
    .line 44
    .line 45
    iget p1, p5, Landroid/graphics/Rect;->left:I

    .line 46
    .line 47
    iget v0, p5, Landroid/graphics/Rect;->top:I

    .line 48
    .line 49
    iget v1, p5, Landroid/graphics/Rect;->right:I

    .line 50
    .line 51
    iget v2, p5, Landroid/graphics/Rect;->bottom:I

    .line 52
    .line 53
    invoke-virtual {p4, p1, v0, v1, v2}, Landroid/view/View;->layout(IIII)V

    .line 54
    .line 55
    .line 56
    iget p1, p5, Landroid/graphics/Rect;->right:I

    .line 57
    .line 58
    iget p4, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->s:I

    .line 59
    .line 60
    add-int/2addr p1, p4

    .line 61
    add-int/lit8 p3, p3, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    return-void
.end method

.method protected onMeasure(II)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->r:I

    .line 2
    .line 3
    if-gtz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->r:I

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-gtz v0, :cond_1

    .line 16
    .line 17
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    const/4 v0, 0x1

    .line 30
    if-ne p2, v0, :cond_2

    .line 31
    .line 32
    const p2, 0x7f070092

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    const p2, 0x7f070091

    .line 37
    .line 38
    .line 39
    :goto_0
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    iget p2, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->r:I

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingLeft()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    sub-int/2addr p2, v1

    .line 50
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingRight()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    sub-int/2addr p2, v1

    .line 55
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    sub-int/2addr v1, v0

    .line 60
    iget v0, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->s:I

    .line 61
    .line 62
    mul-int/2addr v1, v0

    .line 63
    sub-int/2addr p2, v1

    .line 64
    int-to-float p2, p2

    .line 65
    const/high16 v0, 0x3f800000    # 1.0f

    .line 66
    .line 67
    mul-float/2addr p2, v0

    .line 68
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    int-to-float v0, v0

    .line 73
    div-float/2addr p2, v0

    .line 74
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    const/high16 v0, 0x40000000    # 2.0f

    .line 79
    .line 80
    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 81
    .line 82
    .line 83
    move-result p2

    .line 84
    invoke-static {p1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    const/4 v1, 0x0

    .line 89
    :goto_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-ge v1, v2, :cond_3

    .line 94
    .line 95
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-virtual {v2, p2, v0}, Landroid/view/View;->measure(II)V

    .line 100
    .line 101
    .line 102
    add-int/lit8 v1, v1, 0x1

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_3
    iget p2, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->r:I

    .line 106
    .line 107
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingTop()I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    add-int/2addr p1, v0

    .line 112
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getPaddingBottom()I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    add-int/2addr p1, v0

    .line 117
    invoke-virtual {p0, p2, p1}, Landroid/widget/FrameLayout;->setMeasuredDimension(II)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method protected setAICustomWidgetLayout(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;->j:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget-object v0, Lcom/android/launcher3/util/m0;->c:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 12
    .line 13
    new-instance v1, Lcom/android/launcher3/widget/custom/ai/a;

    .line 14
    .line 15
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/widget/custom/ai/a;-><init>(Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
