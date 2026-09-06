.class public Lcom/zte/toolsdk/utils/FeatureUtil;
.super Ljava/lang/Object;
.source "FeatureUtil.java"


# static fields
.field public static final LOG_DEBUG:Z

.field public static final TOOLS_LOG_ENABLE:Ljava/lang/String; = "tools.log.enable"

.field public static final ZTE_FEATURE_AI_TOOLS_MANAGER_ENABLED:Z

.field public static final ZTE_FEATURE_ZPERF_CUBE:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "ZTE_FEATURE_AI_TOOLS_MANAGER_ENABLED"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lcom/zte/toolsdk/utils/FeatureUtil;->getBoolean(Ljava/lang/String;Z)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    sput-boolean v0, Lcom/zte/toolsdk/utils/FeatureUtil;->ZTE_FEATURE_AI_TOOLS_MANAGER_ENABLED:Z

    .line 9
    .line 10
    const-string v0, "ZTE_FEATURE_ZPERF_CUBE"

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/zte/toolsdk/utils/FeatureUtil;->getBoolean(Ljava/lang/String;Z)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    sput-boolean v0, Lcom/zte/toolsdk/utils/FeatureUtil;->ZTE_FEATURE_ZPERF_CUBE:Z

    .line 17
    .line 18
    const-string v0, "tools.log.enable"

    .line 19
    .line 20
    invoke-static {v0}, Lcom/zte/toolsdk/utils/FeatureUtil;->getBoolean(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    sput-boolean v0, Lcom/zte/toolsdk/utils/FeatureUtil;->LOG_DEBUG:Z

    .line 25
    .line 26
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getBoolean(Ljava/lang/String;)Z
    .locals 1

    .line 5
    invoke-static {p0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 6
    const-string v0, "true"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static getBoolean(Ljava/lang/String;Z)Z
    .locals 4

    .line 1
    :try_start_0
    const-string v0, "com.zte.feature.Feature"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 2
    const-string v1, "getBoolean"

    const-class v2, Ljava/lang/String;

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {v2, v3}, [Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {v0, p1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    .line 4
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 p0, 0x0

    return p0
.end method
