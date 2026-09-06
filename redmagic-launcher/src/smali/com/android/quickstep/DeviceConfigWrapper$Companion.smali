.class public final Lcom/android/quickstep/DeviceConfigWrapper$Companion;
.super Ljava/lang/Object;
.source "DeviceConfigWrapper.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/DeviceConfigWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/quickstep/DeviceConfigWrapper$Companion;-><init>()V

    return-void
.end method

.method public static synthetic getConfigHelper$annotations()V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final get()Lcom/android/quickstep/DeviceConfigWrapper;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/DeviceConfigWrapper$Companion;->getConfigHelper()Lcom/android/quickstep/util/DeviceConfigHelper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/quickstep/util/DeviceConfigHelper;->getConfig()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/android/quickstep/DeviceConfigWrapper;

    .line 10
    .line 11
    return-object p0
.end method

.method public final getConfigHelper()Lcom/android/quickstep/util/DeviceConfigHelper;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/quickstep/util/DeviceConfigHelper<",
            "Lcom/android/quickstep/DeviceConfigWrapper;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/quickstep/DeviceConfigWrapper;->access$getConfigHelper$delegate$cp()Lh4/e;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/android/quickstep/util/DeviceConfigHelper;

    .line 10
    .line 11
    return-object p0
.end method
