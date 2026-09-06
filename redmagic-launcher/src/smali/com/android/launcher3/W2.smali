.class public Lcom/android/launcher3/W2;
.super Ljava/lang/Object;
.source "LauncherFiles.java"


# static fields
.field public static a:Ljava/lang/String;

.field public static final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 1
    invoke-static {}, Lcom/android/launcher3/W2;->b()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/android/launcher3/W2;->a:Ljava/lang/String;

    .line 6
    .line 7
    const-string v10, "launcher_7_by_3.db"

    .line 8
    .line 9
    const-string v11, "launcher_8_by_3.db"

    .line 10
    .line 11
    const-string v1, "launcher.db"

    .line 12
    .line 13
    const-string v2, "launcher_5_by_8.db"

    .line 14
    .line 15
    const-string v3, "launcher_6_by_5.db"

    .line 16
    .line 17
    const-string v4, "launcher_4_by_5.db"

    .line 18
    .line 19
    const-string v5, "launcher_4_by_6.db"

    .line 20
    .line 21
    const-string v6, "launcher_5_by_6.db"

    .line 22
    .line 23
    const-string v7, "launcher_4_by_4.db"

    .line 24
    .line 25
    const-string v8, "launcher_3_by_3.db"

    .line 26
    .line 27
    const-string v9, "launcher_2_by_2.db"

    .line 28
    .line 29
    filled-new-array/range {v1 .. v11}, [Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, Lcom/android/launcher3/W2;->b:Ljava/util/List;

    .line 42
    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    sget-object v1, Lcom/android/launcher3/W2;->a:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ".xml"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    const-string v6, "com.android.launcher3.device.prefs.xml"

    .line 63
    .line 64
    const-string v7, "app_icons.db"

    .line 65
    .line 66
    const-string v2, "backup.db"

    .line 67
    .line 68
    const-string v4, "widgetpreviews.db"

    .line 69
    .line 70
    const-string v5, "com.android.launcher3.managedusers.prefs.xml"

    .line 71
    .line 72
    filled-new-array/range {v2 .. v7}, [Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    sput-object v0, Lcom/android/launcher3/W2;->c:Ljava/util/List;

    .line 85
    .line 86
    invoke-static {}, Lcom/android/launcher3/W2;->a()Ljava/util/List;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    sput-object v0, Lcom/android/launcher3/W2;->d:Ljava/util/List;

    .line 91
    .line 92
    return-void
.end method

.method private static a()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
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
    sget-object v1, Lcom/android/launcher3/W2;->b:Ljava/util/List;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    sget-object v1, Lcom/android/launcher3/W2;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    return-object v0
.end method

.method private static b()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/H5;->E()Lcom/android/launcher3/H5$d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/H5$d;->c()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    const-string v0, "com.android.launcher3.prefs"

    .line 13
    .line 14
    return-object v0
.end method

.method public static c()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/W2;->b()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/android/launcher3/W2;->a:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method
