.class public Lcom/android/launcher3/WidgetPickerActivity;
.super Lcom/android/launcher3/v;
.source "WidgetPickerActivity.java"

# interfaces
.implements Lz1/e5$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/WidgetPickerActivity$a;,
        Lcom/android/launcher3/WidgetPickerActivity$b;
    }
.end annotation


# static fields
.field private static final y:Ljava/util/regex/Pattern;


# instance fields
.field private g:Lcom/android/launcher3/dragndrop/SimpleDragLayer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/dragndrop/SimpleDragLayer<",
            "Lcom/android/launcher3/WidgetPickerActivity;",
            ">;"
        }
    .end annotation
.end field

.field private h:Lz1/u5;

.field private i:Lcom/android/launcher3/P2;

.field private j:Lz1/G4;

.field private k:Lz1/e5;

.field private l:Ln2/c;

.field private m:I

.field private n:I

.field private o:Lcom/android/launcher3/widget/picker/c;

.field private p:Lcom/android/launcher3/widget/picker/c;

.field private q:Ljava/lang/String;

.field private r:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/appwidget/AppWidgetProviderInfo;",
            ">;"
        }
    .end annotation
.end field

.field private s:Ljava/lang/String;

.field private t:Ljava/lang/String;

.field u:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private v:Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

.field private final w:Ljava/util/function/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Predicate<",
            "Lz1/Z4;",
            ">;"
        }
    .end annotation
.end field

.field private final x:Ljava/util/function/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Predicate<",
            "Lz1/Z4;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "^(widgets|widgets_hub)$"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/android/launcher3/WidgetPickerActivity;->y:Ljava/util/regex/Pattern;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/v;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/WidgetPickerActivity;->r:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashSet;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/WidgetPickerActivity;->u:Ljava/util/Set;

    .line 17
    .line 18
    new-instance v0, Lcom/android/launcher3/Q5;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Lcom/android/launcher3/Q5;-><init>(Lcom/android/launcher3/WidgetPickerActivity;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/android/launcher3/WidgetPickerActivity;->w:Ljava/util/function/Predicate;

    .line 24
    .line 25
    new-instance v0, Lcom/android/launcher3/R5;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Lcom/android/launcher3/R5;-><init>(Lcom/android/launcher3/WidgetPickerActivity;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/android/launcher3/WidgetPickerActivity;->x:Ljava/util/function/Predicate;

    .line 31
    .line 32
    return-void
.end method

.method private A0()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "picker_title"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/android/launcher3/WidgetPickerActivity;->s:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "picker_description"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/android/launcher3/WidgetPickerActivity;->t:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "desired_widget_width"

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iput v0, p0, Lcom/android/launcher3/WidgetPickerActivity;->m:I

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v1, "desired_widget_height"

    .line 43
    .line 44
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    iput v0, p0, Lcom/android/launcher3/WidgetPickerActivity;->n:I

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-string v1, "categoryFilter"

    .line 55
    .line 56
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    const-string v1, "WidgetPickerActivity"

    .line 61
    .line 62
    if-gez v0, :cond_0

    .line 63
    .line 64
    new-instance v3, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    .line 68
    .line 69
    const-string v4, "Invalid EXTRA_CATEGORY_FILTER: "

    .line 70
    .line 71
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-static {v1, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    :cond_0
    new-instance v3, Lcom/android/launcher3/widget/picker/c;

    .line 85
    .line 86
    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    invoke-direct {v3, v0}, Lcom/android/launcher3/widget/picker/c;-><init>(I)V

    .line 91
    .line 92
    .line 93
    iput-object v3, p0, Lcom/android/launcher3/WidgetPickerActivity;->o:Lcom/android/launcher3/widget/picker/c;

    .line 94
    .line 95
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    const-string v3, "category_exclusion_filter"

    .line 100
    .line 101
    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-lez v0, :cond_1

    .line 106
    .line 107
    new-instance v3, Ljava/lang/StringBuilder;

    .line 108
    .line 109
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 110
    .line 111
    .line 112
    const-string v4, "Invalid EXTRA_CATEGORY_EXCLUSION_FILTER: "

    .line 113
    .line 114
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    invoke-static {v1, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    .line 126
    .line 127
    :cond_1
    new-instance v1, Lcom/android/launcher3/widget/picker/c;

    .line 128
    .line 129
    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    invoke-direct {v1, v0}, Lcom/android/launcher3/widget/picker/c;-><init>(I)V

    .line 134
    .line 135
    .line 136
    iput-object v1, p0, Lcom/android/launcher3/WidgetPickerActivity;->p:Lcom/android/launcher3/widget/picker/c;

    .line 137
    .line 138
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    const-string v1, "ui_surface"

    .line 143
    .line 144
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    if-eqz v0, :cond_2

    .line 149
    .line 150
    sget-object v1, Lcom/android/launcher3/WidgetPickerActivity;->y:Ljava/util/regex/Pattern;

    .line 151
    .line 152
    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    if-eqz v1, :cond_2

    .line 161
    .line 162
    iput-object v0, p0, Lcom/android/launcher3/WidgetPickerActivity;->q:Ljava/lang/String;

    .line 163
    .line 164
    :cond_2
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    const-string v1, "added_app_widgets"

    .line 169
    .line 170
    const-class v2, Landroid/appwidget/AppWidgetProviderInfo;

    .line 171
    .line 172
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;Ljava/lang/Class;)Ljava/util/ArrayList;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    if-eqz v0, :cond_3

    .line 177
    .line 178
    iput-object v0, p0, Lcom/android/launcher3/WidgetPickerActivity;->r:Ljava/util/List;

    .line 179
    .line 180
    :cond_3
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    const-string v1, "filtered_user_ids"

    .line 185
    .line 186
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getIntegerArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    iget-object v1, p0, Lcom/android/launcher3/WidgetPickerActivity;->u:Ljava/util/Set;

    .line 191
    .line 192
    invoke-interface {v1}, Ljava/util/Set;->clear()V

    .line 193
    .line 194
    .line 195
    if-eqz v0, :cond_4

    .line 196
    .line 197
    iget-object p0, p0, Lcom/android/launcher3/WidgetPickerActivity;->u:Ljava/util/Set;

    .line 198
    .line 199
    invoke-interface {p0, v0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 200
    .line 201
    .line 202
    :cond_4
    return-void
.end method

.method private B0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/S5;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/launcher3/S5;-><init>(Lcom/android/launcher3/WidgetPickerActivity;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private static varargs C0(Lz1/Z4;Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/launcher3/WidgetPickerActivity$b;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/WidgetPickerActivity$b;

    .line 2
    .line 3
    iget-object v1, p0, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-object p0, v1, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p0, p0, Lz1/Z4;->g:Ljava/lang/String;

    .line 15
    .line 16
    :goto_0
    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 17
    .line 18
    invoke-static {v1, p1, p2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const/4 p2, 0x0

    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-direct {v0, v1, p0, p1, p2}, Lcom/android/launcher3/WidgetPickerActivity$b;-><init>(ZLjava/lang/String;Ljava/lang/String;Lcom/android/launcher3/b6;)V

    .line 25
    .line 26
    .line 27
    return-object v0
.end method

.method private X(Lz1/G4;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/V5;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/V5;-><init>(Lcom/android/launcher3/WidgetPickerActivity;Lz1/G4;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic b0(Lcom/android/launcher3/WidgetPickerActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/WidgetPickerActivity;->x0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c0(Lcom/android/launcher3/WidgetPickerActivity;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/WidgetPickerActivity;->w0(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d0(Lcom/android/launcher3/WidgetPickerActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/WidgetPickerActivity;->y0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Lcom/android/launcher3/WidgetPickerActivity;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/WidgetPickerActivity;->t0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f0(Lcom/android/launcher3/WidgetPickerActivity;Ljava/util/function/Predicate;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/WidgetPickerActivity;->r0(Ljava/util/function/Predicate;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g0(Lcom/android/launcher3/WidgetPickerActivity;Lz1/G4;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/WidgetPickerActivity;->q0(Lz1/G4;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h0(Lcom/android/launcher3/WidgetPickerActivity;Lz1/Z4;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/WidgetPickerActivity;->u0(Lz1/Z4;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic i0(Lcom/android/launcher3/WidgetPickerActivity;Lz1/Z4;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/WidgetPickerActivity;->v0(Lz1/Z4;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic j0(Lcom/android/launcher3/WidgetPickerActivity;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/WidgetPickerActivity;->s0(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic k0(Lcom/android/launcher3/WidgetPickerActivity;)Lcom/android/launcher3/widget/picker/WidgetsFullSheet;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/WidgetPickerActivity;->v:Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 2
    .line 3
    return-object p0
.end method

.method private static l0(Lz1/Z4;)Lcom/android/launcher3/WidgetPickerActivity$b;
    .locals 4

    .line 1
    new-instance v0, Lcom/android/launcher3/WidgetPickerActivity$b;

    .line 2
    .line 3
    iget-object p0, p0, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 4
    .line 5
    iget-object p0, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v1, ""

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    const/4 v3, 0x1

    .line 15
    invoke-direct {v0, v3, p0, v1, v2}, Lcom/android/launcher3/WidgetPickerActivity$b;-><init>(ZLjava/lang/String;Ljava/lang/String;Lcom/android/launcher3/b6;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method private m0(Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/android/launcher3/model/data/B;",
            "Ljava/util/List<",
            "Lz1/Z4;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lm2/c;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/WidgetPickerActivity;->i:Lcom/android/launcher3/P2;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1}, Lm2/c;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/WidgetPickerActivity;->w:Ljava/util/function/Predicate;

    .line 13
    .line 14
    invoke-virtual {v0, p1, v1}, Lm2/c;->c(Ljava/util/Map;Ljava/util/function/Predicate;)Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-direct {p0}, Lcom/android/launcher3/WidgetPickerActivity;->o0()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/launcher3/WidgetPickerActivity;->x:Ljava/util/function/Predicate;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v0, 0x0

    .line 28
    :goto_0
    sget-object v1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 29
    .line 30
    new-instance v2, Lcom/android/launcher3/U5;

    .line 31
    .line 32
    invoke-direct {v2, p0, v0, p1}, Lcom/android/launcher3/U5;-><init>(Lcom/android/launcher3/WidgetPickerActivity;Ljava/util/function/Predicate;Ljava/util/List;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private o0()Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/WidgetPickerActivity;->m:I

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget p0, p0, Lcom/android/launcher3/WidgetPickerActivity;->n:I

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method private p0(Lz1/Z4;Z)Lcom/android/launcher3/WidgetPickerActivity$b;
    .locals 6

    .line 1
    iget-object v0, p1, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const-string p0, "shortcut"

    .line 7
    .line 8
    new-array p2, v1, [Ljava/lang/Object;

    .line 9
    .line 10
    invoke-static {p1, p0, p2}, Lcom/android/launcher3/WidgetPickerActivity;->C0(Lz1/Z4;Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/launcher3/WidgetPickerActivity$b;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/WidgetPickerActivity;->u:Ljava/util/Set;

    .line 16
    .line 17
    iget-object v3, p1, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 18
    .line 19
    invoke-virtual {v3}, Landroid/os/UserHandle;->getIdentifier()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    iget-object p0, p1, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/os/UserHandle;->getIdentifier()I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const-string p2, "widget user: %d is being filtered"

    .line 48
    .line 49
    invoke-static {p1, p2, p0}, Lcom/android/launcher3/WidgetPickerActivity;->C0(Lz1/Z4;Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/launcher3/WidgetPickerActivity$b;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0

    .line 54
    :cond_1
    iget-object v2, p0, Lcom/android/launcher3/WidgetPickerActivity;->o:Lcom/android/launcher3/widget/picker/c;

    .line 55
    .line 56
    iget v3, v0, Landroid/appwidget/AppWidgetProviderInfo;->widgetCategory:I

    .line 57
    .line 58
    invoke-virtual {v2, v3}, Lcom/android/launcher3/widget/picker/c;->b(I)Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-eqz v2, :cond_c

    .line 63
    .line 64
    iget-object v2, p0, Lcom/android/launcher3/WidgetPickerActivity;->p:Lcom/android/launcher3/widget/picker/c;

    .line 65
    .line 66
    iget v3, v0, Landroid/appwidget/AppWidgetProviderInfo;->widgetCategory:I

    .line 67
    .line 68
    invoke-virtual {v2, v3}, Lcom/android/launcher3/widget/picker/c;->b(I)Z

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    if-nez v2, :cond_2

    .line 73
    .line 74
    goto/16 :goto_2

    .line 75
    .line 76
    :cond_2
    if-eqz p2, :cond_b

    .line 77
    .line 78
    iget p2, p0, Lcom/android/launcher3/WidgetPickerActivity;->m:I

    .line 79
    .line 80
    if-nez p2, :cond_3

    .line 81
    .line 82
    iget v2, p0, Lcom/android/launcher3/WidgetPickerActivity;->n:I

    .line 83
    .line 84
    if-nez v2, :cond_3

    .line 85
    .line 86
    invoke-static {p1}, Lcom/android/launcher3/WidgetPickerActivity;->l0(Lz1/Z4;)Lcom/android/launcher3/WidgetPickerActivity$b;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    return-object p0

    .line 91
    :cond_3
    iget v2, v0, Landroid/appwidget/AppWidgetProviderInfo;->resizeMode:I

    .line 92
    .line 93
    const/4 v3, 0x1

    .line 94
    and-int/2addr v2, v3

    .line 95
    if-eqz v2, :cond_4

    .line 96
    .line 97
    move v2, v3

    .line 98
    goto :goto_0

    .line 99
    :cond_4
    move v2, v1

    .line 100
    :goto_0
    if-lez p2, :cond_6

    .line 101
    .line 102
    if-eqz v2, :cond_6

    .line 103
    .line 104
    iget v4, v0, Landroid/appwidget/AppWidgetProviderInfo;->maxResizeWidth:I

    .line 105
    .line 106
    if-lez v4, :cond_5

    .line 107
    .line 108
    iget v5, v0, Landroid/appwidget/AppWidgetProviderInfo;->minWidth:I

    .line 109
    .line 110
    if-lt v4, v5, :cond_5

    .line 111
    .line 112
    if-ge v4, p2, :cond_5

    .line 113
    .line 114
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 115
    .line 116
    .line 117
    move-result-object p2

    .line 118
    iget p0, p0, Lcom/android/launcher3/WidgetPickerActivity;->m:I

    .line 119
    .line 120
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    filled-new-array {p2, p0}, [Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    const-string p2, "maxResizeWidth[%d] < mDesiredWidgetWidth[%d]"

    .line 129
    .line 130
    invoke-static {p1, p2, p0}, Lcom/android/launcher3/WidgetPickerActivity;->C0(Lz1/Z4;Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/launcher3/WidgetPickerActivity$b;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    return-object p0

    .line 135
    :cond_5
    iget p2, v0, Landroid/appwidget/AppWidgetProviderInfo;->minResizeWidth:I

    .line 136
    .line 137
    iget v4, v0, Landroid/appwidget/AppWidgetProviderInfo;->minWidth:I

    .line 138
    .line 139
    invoke-static {p2, v4}, Ljava/lang/Math;->min(II)I

    .line 140
    .line 141
    .line 142
    move-result p2

    .line 143
    iget v4, p0, Lcom/android/launcher3/WidgetPickerActivity;->m:I

    .line 144
    .line 145
    if-le p2, v4, :cond_6

    .line 146
    .line 147
    iget p2, v0, Landroid/appwidget/AppWidgetProviderInfo;->minWidth:I

    .line 148
    .line 149
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 150
    .line 151
    .line 152
    move-result-object p2

    .line 153
    iget v0, v0, Landroid/appwidget/AppWidgetProviderInfo;->minResizeWidth:I

    .line 154
    .line 155
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    iget p0, p0, Lcom/android/launcher3/WidgetPickerActivity;->m:I

    .line 160
    .line 161
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    filled-new-array {p2, v0, p0}, [Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    const-string p2, "min(minWidth[%d], minResizeWidth[%d]) > mDesiredWidgetWidth[%d]"

    .line 170
    .line 171
    invoke-static {p1, p2, p0}, Lcom/android/launcher3/WidgetPickerActivity;->C0(Lz1/Z4;Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/launcher3/WidgetPickerActivity$b;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    return-object p0

    .line 176
    :cond_6
    iget p2, v0, Landroid/appwidget/AppWidgetProviderInfo;->resizeMode:I

    .line 177
    .line 178
    and-int/lit8 p2, p2, 0x2

    .line 179
    .line 180
    if-eqz p2, :cond_7

    .line 181
    .line 182
    goto :goto_1

    .line 183
    :cond_7
    move v3, v1

    .line 184
    :goto_1
    iget p2, p0, Lcom/android/launcher3/WidgetPickerActivity;->n:I

    .line 185
    .line 186
    if-lez p2, :cond_9

    .line 187
    .line 188
    if-eqz v3, :cond_9

    .line 189
    .line 190
    iget v4, v0, Landroid/appwidget/AppWidgetProviderInfo;->maxResizeHeight:I

    .line 191
    .line 192
    if-lez v4, :cond_8

    .line 193
    .line 194
    iget v5, v0, Landroid/appwidget/AppWidgetProviderInfo;->minHeight:I

    .line 195
    .line 196
    if-lt v4, v5, :cond_8

    .line 197
    .line 198
    if-ge v4, p2, :cond_8

    .line 199
    .line 200
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 201
    .line 202
    .line 203
    move-result-object p2

    .line 204
    iget p0, p0, Lcom/android/launcher3/WidgetPickerActivity;->n:I

    .line 205
    .line 206
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 207
    .line 208
    .line 209
    move-result-object p0

    .line 210
    filled-new-array {p2, p0}, [Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    move-result-object p0

    .line 214
    const-string p2, "maxResizeHeight[%d] < mDesiredWidgetHeight[%d]"

    .line 215
    .line 216
    invoke-static {p1, p2, p0}, Lcom/android/launcher3/WidgetPickerActivity;->C0(Lz1/Z4;Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/launcher3/WidgetPickerActivity$b;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    return-object p0

    .line 221
    :cond_8
    iget p2, v0, Landroid/appwidget/AppWidgetProviderInfo;->minResizeHeight:I

    .line 222
    .line 223
    iget v4, v0, Landroid/appwidget/AppWidgetProviderInfo;->minHeight:I

    .line 224
    .line 225
    invoke-static {p2, v4}, Ljava/lang/Math;->min(II)I

    .line 226
    .line 227
    .line 228
    move-result p2

    .line 229
    iget v4, p0, Lcom/android/launcher3/WidgetPickerActivity;->n:I

    .line 230
    .line 231
    if-le p2, v4, :cond_9

    .line 232
    .line 233
    iget p2, v0, Landroid/appwidget/AppWidgetProviderInfo;->minHeight:I

    .line 234
    .line 235
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 236
    .line 237
    .line 238
    move-result-object p2

    .line 239
    iget v0, v0, Landroid/appwidget/AppWidgetProviderInfo;->minResizeHeight:I

    .line 240
    .line 241
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    iget p0, p0, Lcom/android/launcher3/WidgetPickerActivity;->n:I

    .line 246
    .line 247
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 248
    .line 249
    .line 250
    move-result-object p0

    .line 251
    filled-new-array {p2, v0, p0}, [Ljava/lang/Object;

    .line 252
    .line 253
    .line 254
    move-result-object p0

    .line 255
    const-string p2, "min(minHeight[%d], minResizeHeight[%d]) > mDesiredWidgetHeight[%d]"

    .line 256
    .line 257
    invoke-static {p1, p2, p0}, Lcom/android/launcher3/WidgetPickerActivity;->C0(Lz1/Z4;Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/launcher3/WidgetPickerActivity$b;

    .line 258
    .line 259
    .line 260
    move-result-object p0

    .line 261
    return-object p0

    .line 262
    :cond_9
    if-eqz v2, :cond_a

    .line 263
    .line 264
    if-nez v3, :cond_b

    .line 265
    .line 266
    :cond_a
    const-string p0, "not resizeable"

    .line 267
    .line 268
    new-array p2, v1, [Ljava/lang/Object;

    .line 269
    .line 270
    invoke-static {p1, p0, p2}, Lcom/android/launcher3/WidgetPickerActivity;->C0(Lz1/Z4;Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/launcher3/WidgetPickerActivity$b;

    .line 271
    .line 272
    .line 273
    move-result-object p0

    .line 274
    return-object p0

    .line 275
    :cond_b
    invoke-static {p1}, Lcom/android/launcher3/WidgetPickerActivity;->l0(Lz1/Z4;)Lcom/android/launcher3/WidgetPickerActivity$b;

    .line 276
    .line 277
    .line 278
    move-result-object p0

    .line 279
    return-object p0

    .line 280
    :cond_c
    :goto_2
    iget-object p2, p0, Lcom/android/launcher3/WidgetPickerActivity;->o:Lcom/android/launcher3/widget/picker/c;

    .line 281
    .line 282
    invoke-virtual {p2}, Lcom/android/launcher3/widget/picker/c;->a()I

    .line 283
    .line 284
    .line 285
    move-result p2

    .line 286
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 287
    .line 288
    .line 289
    move-result-object p2

    .line 290
    iget-object p0, p0, Lcom/android/launcher3/WidgetPickerActivity;->p:Lcom/android/launcher3/widget/picker/c;

    .line 291
    .line 292
    invoke-virtual {p0}, Lcom/android/launcher3/widget/picker/c;->a()I

    .line 293
    .line 294
    .line 295
    move-result p0

    .line 296
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 297
    .line 298
    .line 299
    move-result-object p0

    .line 300
    iget v0, v0, Landroid/appwidget/AppWidgetProviderInfo;->widgetCategory:I

    .line 301
    .line 302
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    filled-new-array {p2, p0, v0}, [Ljava/lang/Object;

    .line 307
    .line 308
    .line 309
    move-result-object p0

    .line 310
    const-string p2, "doesn\'t match category filter [inclusion=%d, exclusion=%d, widget=%d]"

    .line 311
    .line 312
    invoke-static {p1, p2, p0}, Lcom/android/launcher3/WidgetPickerActivity;->C0(Lz1/Z4;Ljava/lang/String;[Ljava/lang/Object;)Lcom/android/launcher3/WidgetPickerActivity$b;

    .line 313
    .line 314
    .line 315
    move-result-object p0

    .line 316
    return-object p0
.end method

.method private synthetic q0(Lz1/G4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/WidgetPickerActivity;->j:Lz1/G4;

    .line 2
    .line 3
    return-void
.end method

.method private synthetic r0(Ljava/util/function/Predicate;Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/WidgetPickerActivity;->l:Ln2/c;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ln2/c;->m(Ljava/util/function/Predicate;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/WidgetPickerActivity;->l:Ln2/c;

    .line 7
    .line 8
    invoke-virtual {p0, p2}, Ln2/c;->o(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private synthetic s0(Landroid/view/View;)Z
    .locals 7

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/widget/WidgetCell;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    check-cast p1, Lcom/android/launcher3/widget/WidgetCell;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/android/launcher3/widget/WidgetCell;->getWidgetView()Lcom/android/launcher3/widget/WidgetImageView;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/widget/WidgetImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/launcher3/widget/WidgetCell;->getAppWidgetHostViewPreview()Lcom/android/launcher3/widget/x0;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    return v1

    .line 25
    :cond_0
    invoke-virtual {p1}, Lcom/android/launcher3/widget/WidgetCell;->getWidgetItem()Lz1/Z4;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v0, v0, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 30
    .line 31
    if-eqz v0, :cond_3

    .line 32
    .line 33
    iget-object v2, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 34
    .line 35
    if-nez v2, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    invoke-virtual {p1}, Lcom/android/launcher3/widget/WidgetCell;->getDragAndDropView()Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    if-nez p1, :cond_2

    .line 43
    .line 44
    return v1

    .line 45
    :cond_2
    new-instance v1, Landroid/content/ClipData;

    .line 46
    .line 47
    new-instance v2, Landroid/content/ClipDescription;

    .line 48
    .line 49
    const-string v3, "text/vnd.android.intent"

    .line 50
    .line 51
    filled-new-array {v3}, [Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    const-string v4, ""

    .line 56
    .line 57
    invoke-direct {v2, v4, v3}, Landroid/content/ClipDescription;-><init>(Ljava/lang/CharSequence;[Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    new-instance v3, Landroid/content/ClipData$Item;

    .line 61
    .line 62
    new-instance v4, Landroid/content/Intent;

    .line 63
    .line 64
    invoke-direct {v4}, Landroid/content/Intent;-><init>()V

    .line 65
    .line 66
    .line 67
    const-string v5, "android.intent.extra.USER"

    .line 68
    .line 69
    invoke-virtual {v0}, Landroid/appwidget/AppWidgetProviderInfo;->getProfile()Landroid/os/UserHandle;

    .line 70
    .line 71
    .line 72
    move-result-object v6

    .line 73
    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    const-string v5, "android.intent.extra.COMPONENT_NAME"

    .line 78
    .line 79
    iget-object v0, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 80
    .line 81
    invoke-virtual {v4, v5, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-direct {v3, v0}, Landroid/content/ClipData$Item;-><init>(Landroid/content/Intent;)V

    .line 86
    .line 87
    .line 88
    invoke-direct {v1, v2, v3}, Landroid/content/ClipData;-><init>(Landroid/content/ClipDescription;Landroid/content/ClipData$Item;)V

    .line 89
    .line 90
    .line 91
    new-instance v0, Landroid/content/Intent;

    .line 92
    .line 93
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 94
    .line 95
    .line 96
    const-string v2, "is_pending_widget_drag"

    .line 97
    .line 98
    const/4 v3, 0x1

    .line 99
    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    const/4 v2, -0x1

    .line 104
    invoke-virtual {p0, v2, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 105
    .line 106
    .line 107
    new-instance p0, Landroid/view/View$DragShadowBuilder;

    .line 108
    .line 109
    invoke-direct {p0, p1}, Landroid/view/View$DragShadowBuilder;-><init>(Landroid/view/View;)V

    .line 110
    .line 111
    .line 112
    const/4 v0, 0x0

    .line 113
    const/16 v2, 0x100

    .line 114
    .line 115
    invoke-virtual {p1, v1, p0, v0, v2}, Landroid/view/View;->startDragAndDrop(Landroid/content/ClipData;Landroid/view/View$DragShadowBuilder;Ljava/lang/Object;I)Z

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    return p0

    .line 120
    :cond_3
    :goto_0
    return v1
.end method

.method private synthetic t0(Landroid/view/View;)V
    .locals 3

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/widget/WidgetCell;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/widget/WidgetCell;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/launcher3/widget/WidgetCell;->getWidgetItem()Lz1/Z4;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p1, p1, Lz1/Z4;->d:Lcom/android/launcher3/widget/U;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p1, 0x0

    .line 15
    :goto_0
    if-eqz p1, :cond_2

    .line 16
    .line 17
    iget-object v0, p1, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_1
    new-instance v0, Landroid/content/Intent;

    .line 23
    .line 24
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string v1, "android.intent.extra.COMPONENT_NAME"

    .line 28
    .line 29
    iget-object v2, p1, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "android.intent.extra.USER"

    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/appwidget/AppWidgetProviderInfo;->getProfile()Landroid/os/UserHandle;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const/4 v0, -0x1

    .line 46
    invoke-virtual {p0, v0, p1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 50
    .line 51
    .line 52
    :cond_2
    :goto_1
    return-void
.end method

.method private synthetic u0(Lz1/Z4;)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/WidgetPickerActivity;->p0(Lz1/Z4;Z)Lcom/android/launcher3/WidgetPickerActivity$b;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/WidgetPickerActivity$b;->d()V

    .line 7
    .line 8
    .line 9
    invoke-static {p0}, Lcom/android/launcher3/WidgetPickerActivity$b;->c(Lcom/android/launcher3/WidgetPickerActivity$b;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method private synthetic v0(Lz1/Z4;)Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/WidgetPickerActivity;->p0(Lz1/Z4;Z)Lcom/android/launcher3/WidgetPickerActivity$b;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/WidgetPickerActivity$b;->d()V

    .line 7
    .line 8
    .line 9
    invoke-static {p0}, Lcom/android/launcher3/WidgetPickerActivity$b;->c(Lcom/android/launcher3/WidgetPickerActivity$b;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method private synthetic w0(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/WidgetPickerActivity;->l:Ln2/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ln2/c;->n(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic x0()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->V1(Lcom/android/launcher3/v;Z)Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iput-object v1, p0, Lcom/android/launcher3/WidgetPickerActivity;->v:Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 7
    .line 8
    iget-object v2, p0, Lcom/android/launcher3/WidgetPickerActivity;->s:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v3, p0, Lcom/android/launcher3/WidgetPickerActivity;->t:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v1, v2, v3}, Lcom/android/launcher3/widget/picker/WidgetsFullSheet;->E1(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/launcher3/WidgetPickerActivity;->v:Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Lcom/android/launcher3/widget/o;->C0(Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/launcher3/WidgetPickerActivity;->v:Lcom/android/launcher3/widget/picker/WidgetsFullSheet;

    .line 21
    .line 22
    new-instance v1, Lcom/android/launcher3/X5;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Lcom/android/launcher3/X5;-><init>(Lcom/android/launcher3/WidgetPickerActivity;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/android/launcher3/views/f;->R(Lcom/android/launcher3/views/f$e;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private synthetic y0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/WidgetPickerActivity;->h:Lz1/u5;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lz1/u5;->v(Lcom/android/launcher3/util/L1;)Ljava/util/List;

    .line 5
    .line 6
    .line 7
    new-instance v0, Lz1/G4;

    .line 8
    .line 9
    invoke-direct {v0}, Lz1/G4;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p0}, Lz1/G4;->i(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0, v0}, Lcom/android/launcher3/WidgetPickerActivity;->X(Lz1/G4;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/WidgetPickerActivity;->h:Lz1/u5;

    .line 19
    .line 20
    invoke-virtual {v0}, Lz1/u5;->m()Ljava/util/Map;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-direct {p0, v0}, Lcom/android/launcher3/WidgetPickerActivity;->m0(Ljava/util/Map;)V

    .line 25
    .line 26
    .line 27
    invoke-direct {p0}, Lcom/android/launcher3/WidgetPickerActivity;->z0()V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/android/launcher3/WidgetPickerActivity;->q:Ljava/lang/String;

    .line 31
    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    new-instance v0, Lz1/e5;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iget-object v2, p0, Lcom/android/launcher3/WidgetPickerActivity;->q:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v3, p0, Lcom/android/launcher3/WidgetPickerActivity;->h:Lz1/u5;

    .line 43
    .line 44
    invoke-virtual {v3}, Lz1/u5;->l()Ljava/util/Map;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-direct {v0, v1, v2, v3}, Lz1/e5;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Lcom/android/launcher3/WidgetPickerActivity;->k:Lz1/e5;

    .line 52
    .line 53
    iget-object v1, p0, Lcom/android/launcher3/WidgetPickerActivity;->r:Ljava/util/List;

    .line 54
    .line 55
    invoke-virtual {v0, v1, p0}, Lz1/e5;->m(Ljava/util/List;Lz1/e5$a;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method

.method private z0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/W5;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/launcher3/W5;-><init>(Lcom/android/launcher3/WidgetPickerActivity;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public U(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/android/launcher3/Y5;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/Y5;-><init>(Lcom/android/launcher3/WidgetPickerActivity;Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/v;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 13
    .line 14
    iget p0, p0, Lcom/android/launcher3/h0;->y2:I

    .line 15
    .line 16
    int-to-long p0, p0

    .line 17
    invoke-virtual {v0, v1, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public getAllAppsItemLongClickListener()Landroid/view/View$OnLongClickListener;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/T5;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/T5;-><init>(Lcom/android/launcher3/WidgetPickerActivity;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public bridge synthetic getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/WidgetPickerActivity;->n0()Lcom/android/launcher3/dragndrop/SimpleDragLayer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getForeColor()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getItemOnClickListener()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/P5;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/P5;-><init>(Lcom/android/launcher3/WidgetPickerActivity;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public getStringCache()Lz1/G4;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/WidgetPickerActivity;->j:Lz1/G4;

    .line 2
    .line 3
    return-object p0
.end method

.method public getWidgetPickerDataProvider()Ln2/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/WidgetPickerActivity;->l:Ln2/c;

    .line 2
    .line 3
    return-object p0
.end method

.method public n0()Lcom/android/launcher3/dragndrop/SimpleDragLayer;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/dragndrop/SimpleDragLayer<",
            "Lcom/android/launcher3/WidgetPickerActivity;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/WidgetPickerActivity;->g:Lcom/android/launcher3/dragndrop/SimpleDragLayer;

    .line 2
    .line 3
    return-object p0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/v;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const/high16 v0, 0x80000

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const/high16 v0, 0x100000

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/view/Window;->clearFlags(I)V

    .line 20
    .line 21
    .line 22
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Lcom/android/launcher3/WidgetPickerActivity;->i:Lcom/android/launcher3/P2;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1, p0}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, p0, Lcom/android/launcher3/v;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 37
    .line 38
    new-instance p1, Lz1/u5;

    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/launcher3/WidgetPickerActivity;->i:Lcom/android/launcher3/P2;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->d()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-direct {p1, v0}, Lz1/u5;-><init>(Landroid/content/Context;)V

    .line 47
    .line 48
    .line 49
    iput-object p1, p0, Lcom/android/launcher3/WidgetPickerActivity;->h:Lz1/u5;

    .line 50
    .line 51
    new-instance p1, Ln2/c;

    .line 52
    .line 53
    invoke-direct {p1, p0}, Ln2/c;-><init>(Landroid/content/Context;)V

    .line 54
    .line 55
    .line 56
    iput-object p1, p0, Lcom/android/launcher3/WidgetPickerActivity;->l:Ln2/c;

    .line 57
    .line 58
    const p1, 0x7f0e025f

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setContentView(I)V

    .line 62
    .line 63
    .line 64
    const p1, 0x7f0b022d

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    check-cast p1, Lcom/android/launcher3/dragndrop/SimpleDragLayer;

    .line 72
    .line 73
    iput-object p1, p0, Lcom/android/launcher3/WidgetPickerActivity;->g:Lcom/android/launcher3/dragndrop/SimpleDragLayer;

    .line 74
    .line 75
    invoke-virtual {p1}, Lcom/android/launcher3/dragndrop/SimpleDragLayer;->recreateControllers()V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/android/launcher3/WidgetPickerActivity;->g:Lcom/android/launcher3/dragndrop/SimpleDragLayer;

    .line 79
    .line 80
    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getWindowInsetsController()Landroid/view/WindowInsetsController;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-static {}, Landroid/view/WindowInsets$Type;->navigationBars()I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    invoke-static {}, Landroid/view/WindowInsets$Type;->statusBars()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    add-int/2addr v0, v1

    .line 93
    invoke-interface {p1, v0}, Landroid/view/WindowInsetsController;->hide(I)V

    .line 94
    .line 95
    .line 96
    invoke-direct {p0}, Lcom/android/launcher3/WidgetPickerActivity;->A0()V

    .line 97
    .line 98
    .line 99
    invoke-direct {p0}, Lcom/android/launcher3/WidgetPickerActivity;->B0()V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/v;->onDestroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/WidgetPickerActivity;->l:Ln2/c;

    .line 5
    .line 6
    invoke-virtual {v0}, Ln2/c;->c()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/WidgetPickerActivity;->k:Lz1/e5;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lz1/e5;->g()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method protected registerBackDispatcher()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getOnBackInvokedDispatcher()Landroid/window/OnBackInvokedDispatcher;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/android/launcher3/WidgetPickerActivity$a;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-direct {v1, p0, v2}, Lcom/android/launcher3/WidgetPickerActivity$a;-><init>(Lcom/android/launcher3/WidgetPickerActivity;Lcom/android/launcher3/b6;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    invoke-interface {v0, p0, v1}, Landroid/window/OnBackInvokedDispatcher;->registerOnBackInvokedCallback(ILandroid/window/OnBackInvokedCallback;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
