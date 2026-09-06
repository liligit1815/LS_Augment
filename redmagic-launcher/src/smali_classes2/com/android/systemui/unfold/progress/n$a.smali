.class final Lcom/android/systemui/unfold/progress/n$a;
.super Landroidx/dynamicanimation/animation/g;
.source "UnfoldRemoteFilter.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/unfold/progress/n;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/dynamicanimation/animation/g<",
        "Lcom/android/systemui/unfold/progress/n;",
        ">;"
    }
.end annotation


# static fields
.field public static final a:Lcom/android/systemui/unfold/progress/n$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/systemui/unfold/progress/n$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/systemui/unfold/progress/n$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/systemui/unfold/progress/n$a;->a:Lcom/android/systemui/unfold/progress/n$a;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    const-string v0, "UnfoldRemoteFilter"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Landroidx/dynamicanimation/animation/g;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/android/systemui/unfold/progress/n;)F
    .locals 0

    .line 1
    const-string p0, "provider"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/android/systemui/unfold/progress/n;->d(Lcom/android/systemui/unfold/progress/n;)F

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public b(Lcom/android/systemui/unfold/progress/n;F)V
    .locals 0

    .line 1
    const-string p0, "provider"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p2}, Lcom/android/systemui/unfold/progress/n;->e(Lcom/android/systemui/unfold/progress/n;F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public bridge synthetic getValue(Ljava/lang/Object;)F
    .locals 0

    .line 1
    check-cast p1, Lcom/android/systemui/unfold/progress/n;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/systemui/unfold/progress/n$a;->a(Lcom/android/systemui/unfold/progress/n;)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;F)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/systemui/unfold/progress/n;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/systemui/unfold/progress/n$a;->b(Lcom/android/systemui/unfold/progress/n;F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
