.class Lcom/android/launcher3/q5$J;
.super LV2/b$a;
.source "QuickstepTransitionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/q5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "J"
.end annotation


# instance fields
.field private final g:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/launcher3/q5;",
            ">;"
        }
    .end annotation
.end field

.field private h:I


# direct methods
.method private constructor <init>(Lcom/android/launcher3/q5;)V
    .locals 1

    .line 2
    invoke-direct {p0}, LV2/b$a;-><init>()V

    .line 3
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/android/launcher3/q5$J;->g:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/q5;Lcom/android/launcher3/v5;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/q5$J;-><init>(Lcom/android/launcher3/q5;)V

    return-void
.end method

.method static bridge synthetic o2(Lcom/android/launcher3/q5$J;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/q5$J;->h:I

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public z1(III)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/q5$J;->g:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/android/launcher3/q5;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {v0}, Lcom/android/launcher3/q5;->u(Lcom/android/launcher3/q5;)Ljava/util/LinkedHashMap;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {p2, v1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-virtual {v0, p1, p2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    :cond_0
    iput p3, p0, Lcom/android/launcher3/q5$J;->h:I

    .line 35
    .line 36
    return-void
.end method
