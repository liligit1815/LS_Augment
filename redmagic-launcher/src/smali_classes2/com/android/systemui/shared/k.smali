.class public final synthetic Lcom/android/systemui/shared/k;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Predicate;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/android/systemui/shared/FeatureFlags;

    .line 2
    .line 3
    invoke-interface {p1}, Lcom/android/systemui/shared/FeatureFlags;->returnAnimationFrameworkLibrary()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
