.class public final Lcom/android/quickstep/DeviceConfigWrapper;
.super Ljava/lang/Object;
.source "DeviceConfigWrapper.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/DeviceConfigWrapper$Companion;
    }
.end annotation


# static fields
.field public static final Companion:Lcom/android/quickstep/DeviceConfigWrapper$Companion;

.field public static final DEFAULT_LPNH_TIMEOUT_MS:I = 0x1c2

.field private static final configHelper$delegate:Lh4/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lh4/e<",
            "Lcom/android/quickstep/util/DeviceConfigHelper<",
            "Lcom/android/quickstep/DeviceConfigWrapper;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private final animateLpnh:Z

.field private final customLpaaThresholds:Z

.field private final customLphThresholds:Z

.field private final customLpnhThresholds:Z

.field private final enableLongPressNavHandle:Z

.field private final enableLpnhDeepPress:Z

.field private final enableLpnhTwoStages:Z

.field private final enableSearchHapticCommit:Z

.field private final enableSearchHapticHint:Z

.field private final lpnhExtraTouchWidthDp:I

.field private final lpnhHapticHintDelay:I

.field private final lpnhHapticHintEndScalePercent:I

.field private final lpnhHapticHintIterations:I

.field private final lpnhHapticHintScaleExponent:I

.field private final lpnhHapticHintStartScalePercent:I

.field private final lpnhSlopPercentage:I

.field private final lpnhTimeoutMs:I

.field private final overrideLpnhLphThresholds:Z

.field private final shrinkNavHandleOnPress:Z

.field private final twoStageDurationPercentage:I

.field private final twoStageSlopPercentage:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/DeviceConfigWrapper$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/DeviceConfigWrapper$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/DeviceConfigWrapper;->Companion:Lcom/android/quickstep/DeviceConfigWrapper$Companion;

    .line 8
    .line 9
    new-instance v0, Lcom/android/quickstep/N0;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/android/quickstep/N0;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Lh4/f;->b(Lu4/a;)Lh4/e;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sput-object v0, Lcom/android/quickstep/DeviceConfigWrapper;->configHelper$delegate:Lh4/e;

    .line 19
    .line 20
    return-void
.end method

.method private constructor <init>(Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;)V
    .locals 6

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 4
    const-string v1, "Add dev options and server side control to customize the LPNH trigger slop and milliseconds"

    .line 5
    const-string v2, "CUSTOM_LPNH_THRESHOLDS"

    invoke-virtual {p1, v2, v0, v1}, Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;->get(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/quickstep/DeviceConfigWrapper;->customLpnhThresholds:Z

    .line 6
    const-string v1, "Server side control to customize LPH timeout and touch slop"

    .line 7
    const-string v2, "CUSTOM_LPH_THRESHOLDS"

    invoke-virtual {p1, v2, v0, v1}, Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;->get(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/quickstep/DeviceConfigWrapper;->customLphThresholds:Z

    .line 8
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 9
    const-string v2, "Server side control to customize LPAA timeout and touch slop"

    .line 10
    const-string v3, "CUSTOM_LPAA_THRESHOLDS"

    invoke-virtual {p1, v3, v1, v2}, Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;->get(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iput-boolean v2, p0, Lcom/android/quickstep/DeviceConfigWrapper;->customLpaaThresholds:Z

    .line 11
    const-string v2, "Enable AGSA override for LPNH and LPH timeout and touch slop"

    .line 12
    const-string v3, "OVERRIDE_LPNH_LPH_THRESHOLDS"

    invoke-virtual {p1, v3, v1, v2}, Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;->get(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iput-boolean v2, p0, Lcom/android/quickstep/DeviceConfigWrapper;->overrideLpnhLphThresholds:Z

    const/16 v2, 0x1c2

    .line 13
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 14
    const-string v3, "Controls lpnh timeout in milliseconds"

    .line 15
    const-string v4, "LPNH_TIMEOUT_MS"

    invoke-virtual {p1, v4, v2, v3}, Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;->get(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    iput v2, p0, Lcom/android/quickstep/DeviceConfigWrapper;->lpnhTimeoutMs:I

    const/16 v2, 0x64

    .line 16
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v3, "Controls touch slop percentage for lpnh"

    const-string v4, "LPNH_SLOP_PERCENTAGE"

    invoke-virtual {p1, v4, v2, v3}, Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;->get(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v3

    iput v3, p0, Lcom/android/quickstep/DeviceConfigWrapper;->lpnhSlopPercentage:I

    .line 17
    const-string v3, "Enable two stage for LPNH duration and touch slop"

    .line 18
    const-string v4, "ENABLE_LPNH_TWO_STAGES"

    invoke-virtual {p1, v4, v1, v3}, Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;->get(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    iput-boolean v3, p0, Lcom/android/quickstep/DeviceConfigWrapper;->enableLpnhTwoStages:Z

    const/16 v3, 0xc8

    .line 19
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 20
    const-string v4, "Extends the duration to trigger a long press after a fraction of the gesture slop is passed, expressed as a percentage (i.e. 200 = 2x)."

    .line 21
    const-string v5, "TWO_STAGE_DURATION_PERCENTAGE"

    invoke-virtual {p1, v5, v3, v4}, Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;->get(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v3

    iput v3, p0, Lcom/android/quickstep/DeviceConfigWrapper;->twoStageDurationPercentage:I

    const/16 v3, 0x32

    .line 22
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 23
    const-string v4, "Percentage of gesture slop region to trigger the extended long press duration."

    .line 24
    const-string v5, "TWO_STAGE_SLOP_PERCENTAGE"

    invoke-virtual {p1, v5, v3, v4}, Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;->get(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    move-result v4

    iput v4, p0, Lcom/android/quickstep/DeviceConfigWrapper;->twoStageSlopPercentage:I

    .line 25
    const-string v4, "Animates navbar when long pressing"

    const-string v5, "ANIMATE_LPNH"

    invoke-virtual {p1, v5, v1, v4}, Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;->get(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    iput-boolean v4, p0, Lcom/android/quickstep/DeviceConfigWrapper;->animateLpnh:Z

    .line 26
    const-string v4, "Shrinks navbar when long pressing if ANIMATE_LPNH is enabled"

    .line 27
    const-string v5, "SHRINK_NAV_HANDLE_ON_PRESS"

    invoke-virtual {p1, v5, v1, v4}, Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;->get(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/quickstep/DeviceConfigWrapper;->shrinkNavHandleOnPress:Z

    .line 28
    const-string v1, "Enables long pressing on the bottom bar nav handle to trigger events."

    .line 29
    const-string v4, "ENABLE_LONG_PRESS_NAV_HANDLE"

    invoke-virtual {p1, v4, v0, v1}, Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;->get(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/quickstep/DeviceConfigWrapper;->enableLongPressNavHandle:Z

    .line 30
    const-string v1, "Enables haptic hint while long pressing on the bottom bar nav handle."

    .line 31
    const-string v4, "ENABLE_SEARCH_HAPTIC_HINT"

    invoke-virtual {p1, v4, v0, v1}, Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;->get(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/quickstep/DeviceConfigWrapper;->enableSearchHapticHint:Z

    .line 32
    const-string v1, "Enables haptic hint at end of long pressing on the bottom bar nav handle."

    .line 33
    const-string v4, "ENABLE_SEARCH_HAPTIC_COMMIT"

    invoke-virtual {p1, v4, v0, v1}, Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;->get(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/quickstep/DeviceConfigWrapper;->enableSearchHapticCommit:Z

    const/4 v1, 0x0

    .line 34
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v4, "Haptic hint start scale."

    const-string v5, "LPNH_HAPTIC_HINT_START_SCALE_PERCENT"

    invoke-virtual {p1, v5, v1, v4}, Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;->get(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    move-result v4

    iput v4, p0, Lcom/android/quickstep/DeviceConfigWrapper;->lpnhHapticHintStartScalePercent:I

    .line 35
    const-string v4, "Haptic hint end scale."

    const-string v5, "LPNH_HAPTIC_HINT_END_SCALE_PERCENT"

    invoke-virtual {p1, v5, v2, v4}, Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;->get(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    iput v2, p0, Lcom/android/quickstep/DeviceConfigWrapper;->lpnhHapticHintEndScalePercent:I

    const/4 v2, 0x1

    .line 36
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v4, "Haptic hint scale exponent."

    const-string v5, "LPNH_HAPTIC_HINT_SCALE_EXPONENT"

    invoke-virtual {p1, v5, v2, v4}, Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;->get(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    iput v2, p0, Lcom/android/quickstep/DeviceConfigWrapper;->lpnhHapticHintScaleExponent:I

    .line 37
    const-string v2, "Haptic hint number of iterations."

    const-string v4, "LPNH_HAPTIC_HINT_ITERATIONS"

    invoke-virtual {p1, v4, v3, v2}, Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;->get(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    iput v2, p0, Lcom/android/quickstep/DeviceConfigWrapper;->lpnhHapticHintIterations:I

    .line 38
    const-string v2, "Long press of nav handle is instantly triggered if deep press is detected."

    .line 39
    const-string v3, "ENABLE_LPNH_DEEP_PRESS"

    invoke-virtual {p1, v3, v0, v2}, Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;->get(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->enableLpnhDeepPress:Z

    .line 40
    const-string v0, "Delay before haptic hint starts."

    const-string v2, "LPNH_HAPTIC_HINT_DELAY"

    invoke-virtual {p1, v2, v1, v0}, Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;->get(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    iput v0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->lpnhHapticHintDelay:I

    .line 41
    const-string v0, "Controls extra dp on the nav bar sides to trigger LPNH. Can be negative for a smaller touch region."

    .line 42
    const-string v2, "LPNH_EXTRA_TOUCH_WIDTH_DP"

    invoke-virtual {p1, v2, v1, v0}, Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;->get(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    iput p1, p0, Lcom/android/quickstep/DeviceConfigWrapper;->lpnhExtraTouchWidthDp:I

    return-void
.end method

.method public synthetic constructor <init>(Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/DeviceConfigWrapper;-><init>(Lcom/android/quickstep/util/DeviceConfigHelper$PropReader;)V

    return-void
.end method

.method public static synthetic a()Lcom/android/quickstep/util/DeviceConfigHelper;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/quickstep/DeviceConfigWrapper;->configHelper_delegate$lambda$0()Lcom/android/quickstep/util/DeviceConfigHelper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static final synthetic access$getConfigHelper$delegate$cp()Lh4/e;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/DeviceConfigWrapper;->configHelper$delegate:Lh4/e;

    .line 2
    .line 3
    return-object v0
.end method

.method private static final configHelper_delegate$lambda$0()Lcom/android/quickstep/util/DeviceConfigHelper;
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/util/DeviceConfigHelper;

    .line 2
    .line 3
    sget-object v1, Lcom/android/quickstep/DeviceConfigWrapper$Companion$configHelper$2$1;->INSTANCE:Lcom/android/quickstep/DeviceConfigWrapper$Companion$configHelper$2$1;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/DeviceConfigHelper;-><init>(Lu4/l;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static final get()Lcom/android/quickstep/DeviceConfigWrapper;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/quickstep/DeviceConfigWrapper;->Companion:Lcom/android/quickstep/DeviceConfigWrapper$Companion;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/DeviceConfigWrapper$Companion;->get()Lcom/android/quickstep/DeviceConfigWrapper;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static final getConfigHelper()Lcom/android/quickstep/util/DeviceConfigHelper;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/quickstep/util/DeviceConfigHelper<",
            "Lcom/android/quickstep/DeviceConfigWrapper;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/android/quickstep/DeviceConfigWrapper;->Companion:Lcom/android/quickstep/DeviceConfigWrapper$Companion;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/quickstep/DeviceConfigWrapper$Companion;->getConfigHelper()Lcom/android/quickstep/util/DeviceConfigHelper;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method


# virtual methods
.method public final dump(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 3

    .line 1
    const-string v0, "prefix"

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
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, " DeviceConfigWrapper:"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-boolean v0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->customLpnhThresholds:Z

    .line 32
    .line 33
    new-instance v1, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v2, "\tcustomLpnhThresholds="

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-boolean v0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->customLphThresholds:Z

    .line 57
    .line 58
    new-instance v1, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v2, "\tcustomLphThresholds="

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget-boolean v0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->overrideLpnhLphThresholds:Z

    .line 82
    .line 83
    new-instance v1, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v2, "\toverrideLpnhLphThresholds="

    .line 92
    .line 93
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    iget v0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->lpnhSlopPercentage:I

    .line 107
    .line 108
    new-instance v1, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    const-string v2, "\tlpnhSlopPercentage="

    .line 117
    .line 118
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    iget-boolean v0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->animateLpnh:Z

    .line 132
    .line 133
    new-instance v1, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    const-string v2, "\tanimateLpnh="

    .line 142
    .line 143
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    iget-boolean v0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->shrinkNavHandleOnPress:Z

    .line 157
    .line 158
    new-instance v1, Ljava/lang/StringBuilder;

    .line 159
    .line 160
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    const-string v2, "\tshrinkNavHandleOnPress="

    .line 167
    .line 168
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    iget v0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->lpnhTimeoutMs:I

    .line 182
    .line 183
    new-instance v1, Ljava/lang/StringBuilder;

    .line 184
    .line 185
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 186
    .line 187
    .line 188
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    const-string v2, "\tlpnhTimeoutMs="

    .line 192
    .line 193
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    iget-boolean v0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->enableLpnhTwoStages:Z

    .line 207
    .line 208
    new-instance v1, Ljava/lang/StringBuilder;

    .line 209
    .line 210
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 211
    .line 212
    .line 213
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    const-string v2, "\tenableLpnhTwoStages="

    .line 217
    .line 218
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    iget v0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->twoStageDurationPercentage:I

    .line 232
    .line 233
    new-instance v1, Ljava/lang/StringBuilder;

    .line 234
    .line 235
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 236
    .line 237
    .line 238
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    const-string v2, "\ttwoStageDurationPercentage="

    .line 242
    .line 243
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    iget v0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->twoStageSlopPercentage:I

    .line 257
    .line 258
    new-instance v1, Ljava/lang/StringBuilder;

    .line 259
    .line 260
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 261
    .line 262
    .line 263
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    const-string v2, "\ttwoStageSlopPercentage="

    .line 267
    .line 268
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 269
    .line 270
    .line 271
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 279
    .line 280
    .line 281
    iget-boolean v0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->enableLongPressNavHandle:Z

    .line 282
    .line 283
    new-instance v1, Ljava/lang/StringBuilder;

    .line 284
    .line 285
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 286
    .line 287
    .line 288
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 289
    .line 290
    .line 291
    const-string v2, "\tenableLongPressNavHandle="

    .line 292
    .line 293
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 294
    .line 295
    .line 296
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 297
    .line 298
    .line 299
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 304
    .line 305
    .line 306
    iget-boolean v0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->enableSearchHapticHint:Z

    .line 307
    .line 308
    new-instance v1, Ljava/lang/StringBuilder;

    .line 309
    .line 310
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 311
    .line 312
    .line 313
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 314
    .line 315
    .line 316
    const-string v2, "\tenableSearchHapticHint="

    .line 317
    .line 318
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 319
    .line 320
    .line 321
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 322
    .line 323
    .line 324
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object v0

    .line 328
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 329
    .line 330
    .line 331
    iget-boolean v0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->enableSearchHapticCommit:Z

    .line 332
    .line 333
    new-instance v1, Ljava/lang/StringBuilder;

    .line 334
    .line 335
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 336
    .line 337
    .line 338
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 339
    .line 340
    .line 341
    const-string v2, "\tenableSearchHapticCommit="

    .line 342
    .line 343
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 344
    .line 345
    .line 346
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 347
    .line 348
    .line 349
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 350
    .line 351
    .line 352
    move-result-object v0

    .line 353
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 354
    .line 355
    .line 356
    iget v0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->lpnhHapticHintStartScalePercent:I

    .line 357
    .line 358
    new-instance v1, Ljava/lang/StringBuilder;

    .line 359
    .line 360
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 361
    .line 362
    .line 363
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 364
    .line 365
    .line 366
    const-string v2, "\tlpnhHapticHintStartScalePercent="

    .line 367
    .line 368
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 369
    .line 370
    .line 371
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 372
    .line 373
    .line 374
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 375
    .line 376
    .line 377
    move-result-object v0

    .line 378
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 379
    .line 380
    .line 381
    iget v0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->lpnhHapticHintEndScalePercent:I

    .line 382
    .line 383
    new-instance v1, Ljava/lang/StringBuilder;

    .line 384
    .line 385
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 386
    .line 387
    .line 388
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 389
    .line 390
    .line 391
    const-string v2, "\tlpnhHapticHintEndScalePercent="

    .line 392
    .line 393
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 394
    .line 395
    .line 396
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 397
    .line 398
    .line 399
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 400
    .line 401
    .line 402
    move-result-object v0

    .line 403
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 404
    .line 405
    .line 406
    iget v0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->lpnhHapticHintScaleExponent:I

    .line 407
    .line 408
    new-instance v1, Ljava/lang/StringBuilder;

    .line 409
    .line 410
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 411
    .line 412
    .line 413
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 414
    .line 415
    .line 416
    const-string v2, "\tlpnhHapticHintScaleExponent="

    .line 417
    .line 418
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 419
    .line 420
    .line 421
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 422
    .line 423
    .line 424
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 425
    .line 426
    .line 427
    move-result-object v0

    .line 428
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 429
    .line 430
    .line 431
    iget v0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->lpnhHapticHintIterations:I

    .line 432
    .line 433
    new-instance v1, Ljava/lang/StringBuilder;

    .line 434
    .line 435
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 436
    .line 437
    .line 438
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 439
    .line 440
    .line 441
    const-string v2, "\tlpnhHapticHintIterations="

    .line 442
    .line 443
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 444
    .line 445
    .line 446
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 447
    .line 448
    .line 449
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 450
    .line 451
    .line 452
    move-result-object v0

    .line 453
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 454
    .line 455
    .line 456
    iget-boolean v0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->enableLpnhDeepPress:Z

    .line 457
    .line 458
    new-instance v1, Ljava/lang/StringBuilder;

    .line 459
    .line 460
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 461
    .line 462
    .line 463
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 464
    .line 465
    .line 466
    const-string v2, "\tenableLpnhDeepPress="

    .line 467
    .line 468
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 469
    .line 470
    .line 471
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 472
    .line 473
    .line 474
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 475
    .line 476
    .line 477
    move-result-object v0

    .line 478
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 479
    .line 480
    .line 481
    iget v0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->lpnhHapticHintDelay:I

    .line 482
    .line 483
    new-instance v1, Ljava/lang/StringBuilder;

    .line 484
    .line 485
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 486
    .line 487
    .line 488
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 489
    .line 490
    .line 491
    const-string v2, "\tlpnhHapticHintDelay="

    .line 492
    .line 493
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 494
    .line 495
    .line 496
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 497
    .line 498
    .line 499
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 500
    .line 501
    .line 502
    move-result-object v0

    .line 503
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 504
    .line 505
    .line 506
    iget p0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->lpnhExtraTouchWidthDp:I

    .line 507
    .line 508
    new-instance v0, Ljava/lang/StringBuilder;

    .line 509
    .line 510
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 511
    .line 512
    .line 513
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 514
    .line 515
    .line 516
    const-string p1, "\tlpnhExtraTouchWidthDp="

    .line 517
    .line 518
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 519
    .line 520
    .line 521
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 522
    .line 523
    .line 524
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 525
    .line 526
    .line 527
    move-result-object p0

    .line 528
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 529
    .line 530
    .line 531
    return-void
.end method

.method public final getAnimateLpnh()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->animateLpnh:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getCustomLpaaThresholds()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->customLpaaThresholds:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getCustomLphThresholds()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->customLphThresholds:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getCustomLpnhThresholds()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->customLpnhThresholds:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getEnableLongPressNavHandle()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->enableLongPressNavHandle:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getEnableLpnhDeepPress()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->enableLpnhDeepPress:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getEnableLpnhTwoStages()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->enableLpnhTwoStages:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getEnableSearchHapticCommit()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->enableSearchHapticCommit:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getEnableSearchHapticHint()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->enableSearchHapticHint:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getLpnhExtraTouchWidthDp()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->lpnhExtraTouchWidthDp:I

    .line 2
    .line 3
    return p0
.end method

.method public final getLpnhHapticHintDelay()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->lpnhHapticHintDelay:I

    .line 2
    .line 3
    return p0
.end method

.method public final getLpnhHapticHintEndScalePercent()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->lpnhHapticHintEndScalePercent:I

    .line 2
    .line 3
    return p0
.end method

.method public final getLpnhHapticHintIterations()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->lpnhHapticHintIterations:I

    .line 2
    .line 3
    return p0
.end method

.method public final getLpnhHapticHintScaleExponent()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->lpnhHapticHintScaleExponent:I

    .line 2
    .line 3
    return p0
.end method

.method public final getLpnhHapticHintStartScalePercent()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->lpnhHapticHintStartScalePercent:I

    .line 2
    .line 3
    return p0
.end method

.method public final getLpnhSlopPercentage()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->lpnhSlopPercentage:I

    .line 2
    .line 3
    return p0
.end method

.method public final getLpnhTimeoutMs()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->lpnhTimeoutMs:I

    .line 2
    .line 3
    return p0
.end method

.method public final getOverrideLpnhLphThresholds()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->overrideLpnhLphThresholds:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getShrinkNavHandleOnPress()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->shrinkNavHandleOnPress:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getTwoStageDurationPercentage()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->twoStageDurationPercentage:I

    .line 2
    .line 3
    return p0
.end method

.method public final getTwoStageSlopPercentage()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/quickstep/DeviceConfigWrapper;->twoStageSlopPercentage:I

    .line 2
    .line 3
    return p0
.end method
