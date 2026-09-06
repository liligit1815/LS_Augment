.class public final Lcom/android/quickstep/util/DeviceConfigHelper;
.super Ljava/lang/Object;
.source "DeviceConfigHelper.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/DeviceConfigHelper$Companion;,
        Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo;,
        Lcom/android/quickstep/util/DeviceConfigHelper$PropProvider;,
        Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<ConfigType:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/util/DeviceConfigHelper$Companion;

.field private static final FLAGS_PREF_NAME:Ljava/lang/String; = "featureFlags"

.field public static final NAMESPACE_LAUNCHER:Ljava/lang/String; = "launcher"

.field private static final allProps:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/android/quickstep/util/DeviceConfigHelper$DebugInfo<",
            "*>;>;"
        }
    .end annotation
.end field

.field private static final prefs$delegate:Lh4/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lh4/e<",
            "Landroid/content/SharedPreferences;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final allKeys:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final changeListeners:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private config:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TConfigType;"
        }
    .end annotation
.end field

.field private final factory:Lu4/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/l<",
            "Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;",
            "TConfigType;>;"
        }
    .end annotation
.end field

.field private final propertiesListener:Landroid/provider/DeviceConfig$OnPropertiesChangedListener;

.field private final sharedPrefChangeListener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/util/DeviceConfigHelper$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/DeviceConfigHelper$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/util/DeviceConfigHelper;->Companion:Lcom/android/quickstep/util/DeviceConfigHelper$Companion;

    .line 8
    .line 9
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/android/quickstep/util/DeviceConfigHelper;->allProps:Ljava/util/Map;

    .line 15
    .line 16
    new-instance v0, Lcom/android/quickstep/util/X;

    .line 17
    .line 18
    invoke-direct {v0}, Lcom/android/quickstep/util/X;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v0}, Lh4/f;->b(Lu4/a;)Lh4/e;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Lcom/android/quickstep/util/DeviceConfigHelper;->prefs$delegate:Lh4/e;

    .line 26
    .line 27
    return-void
.end method

.method public constructor <init>(Lu4/l;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/l<",
            "-",
            "Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;",
            "+TConfigType;>;)V"
        }
    .end annotation

    .line 1
    const-string v0, "factory"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/quickstep/util/DeviceConfigHelper;->factory:Lu4/l;

    .line 10
    .line 11
    new-instance v0, Lcom/android/quickstep/util/U;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/android/quickstep/util/U;-><init>(Lcom/android/quickstep/util/DeviceConfigHelper;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/quickstep/util/DeviceConfigHelper;->propertiesListener:Landroid/provider/DeviceConfig$OnPropertiesChangedListener;

    .line 17
    .line 18
    new-instance v1, Lcom/android/quickstep/util/V;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Lcom/android/quickstep/util/V;-><init>(Lcom/android/quickstep/util/DeviceConfigHelper;)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/android/quickstep/util/DeviceConfigHelper;->sharedPrefChangeListener:Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;

    .line 24
    .line 25
    new-instance v1, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 26
    .line 27
    invoke-direct {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Lcom/android/quickstep/util/DeviceConfigHelper;->changeListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 31
    .line 32
    new-instance v1, Ljava/util/HashSet;

    .line 33
    .line 34
    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Lcom/android/quickstep/util/DeviceConfigHelper;->allKeys:Ljava/util/Set;

    .line 38
    .line 39
    new-instance v1, Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;

    .line 40
    .line 41
    new-instance v2, Lcom/android/quickstep/util/DeviceConfigHelper$1;

    .line 42
    .line 43
    invoke-direct {v2, p0}, Lcom/android/quickstep/util/DeviceConfigHelper$1;-><init>(Lcom/android/quickstep/util/DeviceConfigHelper;)V

    .line 44
    .line 45
    .line 46
    invoke-direct {v1, v2}, Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;-><init>(Lcom/android/quickstep/util/DeviceConfigHelper$PropProvider;)V

    .line 47
    .line 48
    .line 49
    invoke-interface {p1, v1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iput-object p1, p0, Lcom/android/quickstep/util/DeviceConfigHelper;->config:Ljava/lang/Object;

    .line 54
    .line 55
    const-string p0, "launcher"

    .line 56
    .line 57
    sget-object p1, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 58
    .line 59
    invoke-static {p0, p1, v0}, Landroid/provider/DeviceConfig;->addOnPropertiesChangedListener(Ljava/lang/String;Ljava/util/concurrent/Executor;Landroid/provider/DeviceConfig$OnPropertiesChangedListener;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public static synthetic a(Lcom/android/quickstep/util/DeviceConfigHelper;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/quickstep/util/DeviceConfigHelper;->recreateConfig$lambda$3(Lcom/android/quickstep/util/DeviceConfigHelper;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic access$getAllKeys$p(Lcom/android/quickstep/util/DeviceConfigHelper;)Ljava/util/Set;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/DeviceConfigHelper;->allKeys:Ljava/util/Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic access$getAllProps$cp()Ljava/util/Map;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/DeviceConfigHelper;->allProps:Ljava/util/Map;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic access$getPrefs$delegate$cp()Lh4/e;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/util/DeviceConfigHelper;->prefs$delegate:Lh4/e;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic b(Lcom/android/quickstep/util/DeviceConfigHelper;Landroid/provider/DeviceConfig$Properties;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/quickstep/util/DeviceConfigHelper;->propertiesListener$lambda$0(Lcom/android/quickstep/util/DeviceConfigHelper;Landroid/provider/DeviceConfig$Properties;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c()Landroid/content/SharedPreferences;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/quickstep/util/DeviceConfigHelper;->prefs_delegate$lambda$4()Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static synthetic d(Lcom/android/quickstep/util/DeviceConfigHelper;Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/util/DeviceConfigHelper;->sharedPrefChangeListener$lambda$1(Lcom/android/quickstep/util/DeviceConfigHelper;Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final onDevicePropsChanges(Landroid/provider/DeviceConfig$Properties;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/provider/DeviceConfig$Properties;->getNamespace()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "launcher"

    .line 6
    .line 7
    invoke-static {v1, v0}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/android/quickstep/util/DeviceConfigHelper;->allKeys:Ljava/util/Set;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/provider/DeviceConfig$Properties;->getKeyset()Ljava/util/Set;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_3

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Ljava/lang/String;

    .line 44
    .line 45
    invoke-interface {p1, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    invoke-direct {p0}, Lcom/android/quickstep/util/DeviceConfigHelper;->recreateConfig()V

    .line 52
    .line 53
    .line 54
    :cond_3
    return-void
.end method

.method private static final prefs_delegate$lambda$4()Landroid/content/SharedPreferences;
    .locals 3

    .line 1
    invoke-static {}, Landroid/app/ActivityThread;->currentApplication()Landroid/app/Application;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/app/Application;->createDeviceProtectedStorageContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "featureFlags"

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    return-object v0
.end method

.method private static final propertiesListener$lambda$0(Lcom/android/quickstep/util/DeviceConfigHelper;Landroid/provider/DeviceConfig$Properties;)V
    .locals 1

    .line 1
    const-string v0, "it"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/DeviceConfigHelper;->onDevicePropsChanges(Landroid/provider/DeviceConfig$Properties;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private final recreateConfig()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/DeviceConfigHelper;->allKeys:Ljava/util/Set;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    new-array v1, v1, [Ljava/lang/String;

    .line 5
    .line 6
    invoke-interface {v0, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, [Ljava/lang/String;

    .line 11
    .line 12
    array-length v1, v0

    .line 13
    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, [Ljava/lang/String;

    .line 18
    .line 19
    const-string v1, "launcher"

    .line 20
    .line 21
    invoke-static {v1, v0}, Landroid/provider/DeviceConfig;->getProperties(Ljava/lang/String;[Ljava/lang/String;)Landroid/provider/DeviceConfig$Properties;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "getProperties(...)"

    .line 26
    .line 27
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/android/quickstep/util/DeviceConfigHelper;->factory:Lu4/l;

    .line 31
    .line 32
    new-instance v2, Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;

    .line 33
    .line 34
    new-instance v3, Lcom/android/quickstep/util/DeviceConfigHelper$recreateConfig$1;

    .line 35
    .line 36
    invoke-direct {v3, v0}, Lcom/android/quickstep/util/DeviceConfigHelper$recreateConfig$1;-><init>(Landroid/provider/DeviceConfig$Properties;)V

    .line 37
    .line 38
    .line 39
    invoke-direct {v2, v3}, Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;-><init>(Lcom/android/quickstep/util/DeviceConfigHelper$PropProvider;)V

    .line 40
    .line 41
    .line 42
    invoke-interface {v1, v2}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Lcom/android/quickstep/util/DeviceConfigHelper;->config:Ljava/lang/Object;

    .line 47
    .line 48
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 49
    .line 50
    new-instance v1, Lcom/android/quickstep/util/W;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Lcom/android/quickstep/util/W;-><init>(Lcom/android/quickstep/util/DeviceConfigHelper;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method private static final recreateConfig$lambda$3(Lcom/android/quickstep/util/DeviceConfigHelper;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/DeviceConfigHelper;->changeListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/lang/Runnable;

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method private static final sharedPrefChangeListener$lambda$1(Lcom/android/quickstep/util/DeviceConfigHelper;Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/util/DeviceConfigHelper;->recreateConfig()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final addChangeListener(Ljava/lang/Runnable;)Z
    .locals 1

    .line 1
    const-string v0, "r"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/util/DeviceConfigHelper;->changeListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final close()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/DeviceConfigHelper;->propertiesListener:Landroid/provider/DeviceConfig$OnPropertiesChangedListener;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/provider/DeviceConfig;->removeOnPropertiesChangedListener(Landroid/provider/DeviceConfig$OnPropertiesChangedListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final getConfig()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TConfigType;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/util/DeviceConfigHelper;->config:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public final removeChangeListener(Ljava/lang/Runnable;)Z
    .locals 1

    .line 1
    const-string v0, "r"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/quickstep/util/DeviceConfigHelper;->changeListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method
