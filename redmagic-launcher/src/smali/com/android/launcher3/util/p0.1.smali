.class public interface abstract Lcom/android/launcher3/util/p0;
.super Ljava/lang/Object;
.source "FlagOp.java"


# static fields
.field public static final a:Lcom/android/launcher3/util/p0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/util/o0;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/util/o0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/util/p0;->a:Lcom/android/launcher3/util/p0;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic c(I)I
    .locals 0

    .line 1
    return p0
.end method


# virtual methods
.method public a(I)Lcom/android/launcher3/util/p0;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/util/p0$b;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/util/p0$b;-><init>(Lcom/android/launcher3/util/p0;I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public abstract apply(I)I
.end method

.method public b(I)Lcom/android/launcher3/util/p0;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/util/p0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/util/p0$a;-><init>(Lcom/android/launcher3/util/p0;I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public d(IZ)Lcom/android/launcher3/util/p0;
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/android/launcher3/util/p0;->b(I)Lcom/android/launcher3/util/p0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-interface {p0, p1}, Lcom/android/launcher3/util/p0;->a(I)Lcom/android/launcher3/util/p0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
