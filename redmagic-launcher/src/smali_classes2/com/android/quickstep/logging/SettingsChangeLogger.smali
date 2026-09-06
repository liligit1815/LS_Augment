.class public Lcom/android/quickstep/logging/SettingsChangeLogger;
.super Ljava/lang/Object;
.source "SettingsChangeLogger.java"

# interfaces
.implements Lcom/android/launcher3/util/Z$b;
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/logging/SettingsChangeLogger$LoggablePref;
    }
.end annotation


# static fields
.field private static final BOOLEAN_PREF:Ljava/lang/String; = "SwitchPreference"

.field public static INSTANCE:Lcom/android/launcher3/util/I; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/quickstep/logging/SettingsChangeLogger;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "SettingsChangeLogger"


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mHomeScreenSuggestionEvent:Lcom/android/launcher3/logging/StatsLogManager$e;

.field private final mListener:Lcom/android/launcher3/util/p2$a;

.field private final mLoggablePrefs:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Ljava/lang/String;",
            "Lcom/android/quickstep/logging/SettingsChangeLogger$LoggablePref;",
            ">;"
        }
    .end annotation
.end field

.field private mNavMode:Lcom/android/launcher3/util/C1;

.field private mNotificationDotsEvent:Lcom/android/launcher3/logging/StatsLogManager$e;

.field private final mStatsLogManager:Lcom/android/launcher3/logging/StatsLogManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    new-instance v1, Lcom/android/quickstep/logging/e;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/quickstep/logging/e;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/android/quickstep/logging/SettingsChangeLogger;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 12
    .line 13
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/android/launcher3/logging/StatsLogManager;Lcom/android/launcher3/util/K;Lcom/android/launcher3/util/Z;Lcom/android/launcher3/util/p2;)V
    .locals 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    new-instance v0, Lcom/android/quickstep/logging/f;

    invoke-direct {v0, p0}, Lcom/android/quickstep/logging/f;-><init>(Lcom/android/quickstep/logging/SettingsChangeLogger;)V

    iput-object v0, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mListener:Lcom/android/launcher3/util/p2$a;

    .line 4
    iput-object p1, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mContext:Landroid/content/Context;

    .line 5
    iput-object p2, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mStatsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

    .line 6
    invoke-static {p1}, Lcom/android/quickstep/logging/SettingsChangeLogger;->loadPrefKeys(Landroid/content/Context;)Landroid/util/ArrayMap;

    move-result-object p2

    iput-object p2, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mLoggablePrefs:Landroid/util/ArrayMap;

    .line 7
    invoke-virtual {p4, p0}, Lcom/android/launcher3/util/Z;->o(Lcom/android/launcher3/util/Z$b;)V

    .line 8
    invoke-virtual {p4}, Lcom/android/launcher3/util/Z;->w()Lcom/android/launcher3/util/Z$c;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/launcher3/util/Z$c;->n()Lcom/android/launcher3/util/C1;

    move-result-object p2

    iput-object p2, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mNavMode:Lcom/android/launcher3/util/C1;

    .line 9
    new-instance p2, Lcom/android/quickstep/logging/g;

    invoke-direct {p2, p0, p4}, Lcom/android/quickstep/logging/g;-><init>(Lcom/android/quickstep/logging/SettingsChangeLogger;Lcom/android/launcher3/util/Z;)V

    invoke-virtual {p3, p2}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 10
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p2

    invoke-interface {p2, p0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 11
    invoke-static {p1}, Lcom/android/launcher3/J3;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1, p0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 12
    new-instance p1, Lcom/android/quickstep/logging/h;

    invoke-direct {p1, p0}, Lcom/android/quickstep/logging/h;-><init>(Lcom/android/quickstep/logging/SettingsChangeLogger;)V

    invoke-virtual {p3, p1}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 13
    sget-object p1, Lcom/android/launcher3/util/p2;->h:Landroid/net/Uri;

    invoke-virtual {p5, p1, v0}, Lcom/android/launcher3/util/p2;->m(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 14
    invoke-virtual {p5, p1}, Lcom/android/launcher3/util/p2;->f(Landroid/net/Uri;)Z

    move-result p1

    invoke-direct {p0, p1}, Lcom/android/quickstep/logging/SettingsChangeLogger;->onNotificationDotsChanged(Z)V

    .line 15
    new-instance p1, Lcom/android/quickstep/logging/i;

    invoke-direct {p1, p0, p5}, Lcom/android/quickstep/logging/i;-><init>(Lcom/android/quickstep/logging/SettingsChangeLogger;Lcom/android/launcher3/util/p2;)V

    invoke-virtual {p3, p1}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lcom/android/launcher3/util/K;Lcom/android/launcher3/util/Z;Lcom/android/launcher3/util/p2;)V
    .locals 6

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/logging/StatsLogManager;->newInstance(Landroid/content/Context;)Lcom/android/launcher3/logging/StatsLogManager;

    move-result-object v2

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/android/quickstep/logging/SettingsChangeLogger;-><init>(Landroid/content/Context;Lcom/android/launcher3/logging/StatsLogManager;Lcom/android/launcher3/util/K;Lcom/android/launcher3/util/Z;Lcom/android/launcher3/util/p2;)V

    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/logging/StatsLogManager$i;Landroid/content/SharedPreferences;Ljava/lang/String;Lcom/android/quickstep/logging/SettingsChangeLogger$LoggablePref;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/quickstep/logging/d;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3}, Lcom/android/quickstep/logging/d;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;Lcom/android/quickstep/logging/SettingsChangeLogger$LoggablePref;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/util/C1;)Lcom/android/launcher3/logging/StatsLogManager$e;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/C1;->i:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Lcom/android/quickstep/logging/SettingsChangeLogger;Lcom/android/launcher3/util/Z;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/logging/SettingsChangeLogger;->lambda$new$0(Lcom/android/launcher3/util/Z;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Landroid/content/SharedPreferences;Ljava/lang/String;Lcom/android/quickstep/logging/SettingsChangeLogger$LoggablePref;)I
    .locals 1

    .line 1
    iget-boolean v0, p2, Lcom/android/quickstep/logging/SettingsChangeLogger$LoggablePref;->defaultValue:Z

    .line 2
    .line 3
    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget p0, p2, Lcom/android/quickstep/logging/SettingsChangeLogger$LoggablePref;->eventIdOn:I

    .line 10
    .line 11
    return p0

    .line 12
    :cond_0
    iget p0, p2, Lcom/android/quickstep/logging/SettingsChangeLogger$LoggablePref;->eventIdOff:I

    .line 13
    .line 14
    return p0
.end method

.method public static synthetic e(Lcom/android/quickstep/logging/SettingsChangeLogger;Lcom/android/launcher3/util/p2;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/logging/SettingsChangeLogger;->lambda$new$2(Lcom/android/launcher3/util/p2;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/android/quickstep/logging/SettingsChangeLogger;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/logging/SettingsChangeLogger;->lambda$new$1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/android/quickstep/logging/SettingsChangeLogger;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/logging/SettingsChangeLogger;->onNotificationDotsChanged(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$new$0(Lcom/android/launcher3/util/Z;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/Z;->P(Lcom/android/launcher3/util/Z$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$new$1()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mContext:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mContext:Landroid/content/Context;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/android/launcher3/J3;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private synthetic lambda$new$2(Lcom/android/launcher3/util/p2;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/p2;->h:Landroid/net/Uri;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mListener:Lcom/android/launcher3/util/p2$a;

    .line 4
    .line 5
    invoke-virtual {p1, v0, p0}, Lcom/android/launcher3/util/p2;->p(Landroid/net/Uri;Lcom/android/launcher3/util/p2$a;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private static loadPrefKeys(Landroid/content/Context;)Landroid/util/ArrayMap;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Landroid/util/ArrayMap<",
            "Ljava/lang/String;",
            "Lcom/android/quickstep/logging/SettingsChangeLogger$LoggablePref;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f17000f

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Landroid/util/ArrayMap;

    .line 13
    .line 14
    invoke-direct {v1}, Landroid/util/ArrayMap;-><init>()V

    .line 15
    .line 16
    .line 17
    :try_start_0
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    :goto_0
    const/4 v3, 0x2

    .line 22
    const/4 v4, 0x1

    .line 23
    if-eq v2, v3, :cond_0

    .line 24
    .line 25
    if-eq v2, v4, :cond_0

    .line 26
    .line 27
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    goto :goto_0

    .line 32
    :catch_0
    move-exception p0

    .line 33
    goto :goto_2

    .line 34
    :cond_0
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    :cond_1
    :goto_1
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    const/4 v6, 0x3

    .line 43
    if-ne v5, v6, :cond_2

    .line 44
    .line 45
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    .line 46
    .line 47
    .line 48
    move-result v7

    .line 49
    if-le v7, v2, :cond_5

    .line 50
    .line 51
    :cond_2
    if-eq v5, v4, :cond_5

    .line 52
    .line 53
    if-eq v5, v3, :cond_3

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_3
    const-string v5, "SwitchPreference"

    .line 57
    .line 58
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v7

    .line 62
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    if-eqz v5, :cond_1

    .line 67
    .line 68
    invoke-static {v0}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    sget-object v7, Lcom/android/launcher3/x5;->n1:[I

    .line 73
    .line 74
    invoke-virtual {p0, v5, v7}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    const/4 v7, 0x0

    .line 79
    invoke-virtual {v5, v7}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v8

    .line 83
    new-instance v9, Lcom/android/quickstep/logging/SettingsChangeLogger$LoggablePref;

    .line 84
    .line 85
    invoke-direct {v9}, Lcom/android/quickstep/logging/SettingsChangeLogger$LoggablePref;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v5, v4, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 89
    .line 90
    .line 91
    move-result v10

    .line 92
    iput-boolean v10, v9, Lcom/android/quickstep/logging/SettingsChangeLogger$LoggablePref;->defaultValue:Z

    .line 93
    .line 94
    invoke-virtual {v5, v6, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 95
    .line 96
    .line 97
    move-result v6

    .line 98
    iput v6, v9, Lcom/android/quickstep/logging/SettingsChangeLogger$LoggablePref;->eventIdOn:I

    .line 99
    .line 100
    invoke-virtual {v5, v3, v7}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 101
    .line 102
    .line 103
    move-result v6

    .line 104
    iput v6, v9, Lcom/android/quickstep/logging/SettingsChangeLogger$LoggablePref;->eventIdOff:I

    .line 105
    .line 106
    if-lez v6, :cond_4

    .line 107
    .line 108
    iget v6, v9, Lcom/android/quickstep/logging/SettingsChangeLogger$LoggablePref;->eventIdOn:I

    .line 109
    .line 110
    if-lez v6, :cond_4

    .line 111
    .line 112
    invoke-virtual {v1, v8, v9}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    :cond_4
    invoke-virtual {v5}, Landroid/content/res/TypedArray;->recycle()V
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    .line 117
    .line 118
    goto :goto_1

    .line 119
    :goto_2
    const-string v0, "SettingsChangeLogger"

    .line 120
    .line 121
    const-string v2, "Error parsing preference xml"

    .line 122
    .line 123
    invoke-static {v0, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 124
    .line 125
    .line 126
    :cond_5
    return-object v1
.end method

.method private onNotificationDotsChanged(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->E0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->F0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 7
    .line 8
    :goto_0
    iget-object v0, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mNotificationDotsEvent:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    if-eq v0, p1, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mStatsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mNotificationDotsEvent:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 21
    .line 22
    invoke-interface {v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    iput-object p1, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mNotificationDotsEvent:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method getLoggingPrefs()Landroid/util/ArrayMap;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/ArrayMap<",
            "Ljava/lang/String;",
            "Lcom/android/quickstep/logging/SettingsChangeLogger$LoggablePref;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mLoggablePrefs:Landroid/util/ArrayMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public logSnapshot(Lcom/android/launcher3/logging/d;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mStatsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0, p1}, Lcom/android/launcher3/logging/StatsLogManager$i;->withInstanceId(Lcom/android/launcher3/logging/d;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object v0, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mNotificationDotsEvent:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 12
    .line 13
    invoke-static {v0}, Ljava/util/Optional;->ofNullable(Ljava/lang/Object;)Ljava/util/Optional;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    new-instance v1, Lcom/android/quickstep/logging/a;

    .line 21
    .line 22
    invoke-direct {v1, p1}, Lcom/android/quickstep/logging/a;-><init>(Lcom/android/launcher3/logging/StatsLogManager$i;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mNavMode:Lcom/android/launcher3/util/C1;

    .line 29
    .line 30
    invoke-static {v0}, Ljava/util/Optional;->ofNullable(Ljava/lang/Object;)Ljava/util/Optional;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Lcom/android/quickstep/logging/b;

    .line 35
    .line 36
    invoke-direct {v1}, Lcom/android/quickstep/logging/b;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/util/Optional;->map(Ljava/util/function/Function;)Ljava/util/Optional;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Lcom/android/quickstep/logging/a;

    .line 44
    .line 45
    invoke-direct {v1, p1}, Lcom/android/quickstep/logging/a;-><init>(Lcom/android/launcher3/logging/StatsLogManager$i;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mHomeScreenSuggestionEvent:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 52
    .line 53
    invoke-static {v0}, Ljava/util/Optional;->ofNullable(Ljava/lang/Object;)Ljava/util/Optional;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Lcom/android/quickstep/logging/a;

    .line 58
    .line 59
    invoke-direct {v1, p1}, Lcom/android/quickstep/logging/a;-><init>(Lcom/android/launcher3/logging/StatsLogManager$i;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 63
    .line 64
    .line 65
    new-instance v0, Lz1/L0;

    .line 66
    .line 67
    iget-object v1, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mContext:Landroid/content/Context;

    .line 68
    .line 69
    invoke-direct {v0, v1}, Lz1/L0;-><init>(Landroid/content/Context;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, Lz1/L0;->j()Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-static {v0}, Ljava/util/Optional;->ofNullable(Ljava/lang/Object;)Ljava/util/Optional;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    new-instance v1, Lcom/android/quickstep/logging/a;

    .line 81
    .line 82
    invoke-direct {v1, p1}, Lcom/android/quickstep/logging/a;-><init>(Lcom/android/launcher3/logging/StatsLogManager$i;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mContext:Landroid/content/Context;

    .line 89
    .line 90
    invoke-static {v0}, Lcom/android/launcher3/J3;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    const-string v1, "themed_icons"

    .line 95
    .line 96
    const/4 v2, 0x0

    .line 97
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-eqz v1, :cond_0

    .line 102
    .line 103
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$e;->f2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_0
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$e;->g2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 107
    .line 108
    :goto_0
    invoke-interface {p1, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 109
    .line 110
    .line 111
    iget-object p0, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mLoggablePrefs:Landroid/util/ArrayMap;

    .line 112
    .line 113
    new-instance v1, Lcom/android/quickstep/logging/c;

    .line 114
    .line 115
    invoke-direct {v1, p1, v0}, Lcom/android/quickstep/logging/c;-><init>(Lcom/android/launcher3/logging/StatsLogManager$i;Landroid/content/SharedPreferences;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0, v1}, Landroid/util/ArrayMap;->forEach(Ljava/util/function/BiConsumer;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public onDisplayInfoChanged(Landroid/content/Context;Lcom/android/launcher3/util/Z$c;I)V
    .locals 0

    .line 1
    and-int/lit8 p1, p3, 0x10

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/android/launcher3/util/Z$c;->n()Lcom/android/launcher3/util/C1;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mNavMode:Lcom/android/launcher3/util/C1;

    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mStatsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object p0, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mNavMode:Lcom/android/launcher3/util/C1;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/util/C1;->i:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 20
    .line 21
    invoke-interface {p1, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object p1, Lz1/p4;->c:Lcom/android/launcher3/X;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/X;->c()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    const-string v0, "migration_src_workspace_size"

    .line 14
    .line 15
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    const-string v0, "themed_icons"

    .line 22
    .line 23
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mLoggablePrefs:Landroid/util/ArrayMap;

    .line 30
    .line 31
    invoke-virtual {v0, p2}, Landroid/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-eqz p2, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    return-void

    .line 39
    :cond_1
    :goto_0
    iget-object p2, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mContext:Landroid/content/Context;

    .line 40
    .line 41
    invoke-static {p2}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {p2, p1}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Ljava/lang/Boolean;

    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_2

    .line 56
    .line 57
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->M0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_2
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->N0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 61
    .line 62
    :goto_1
    iput-object p1, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mHomeScreenSuggestionEvent:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 63
    .line 64
    iget-object p1, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mStatsLogManager:Lcom/android/launcher3/logging/StatsLogManager;

    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iget-object p0, p0, Lcom/android/quickstep/logging/SettingsChangeLogger;->mHomeScreenSuggestionEvent:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 71
    .line 72
    invoke-interface {p1, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method
