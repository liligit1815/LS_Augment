.class public final LU/b;
.super Ljava/lang/Object;
.source "CornerRounding.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LU/b$a;
    }
.end annotation


# static fields
.field public static final c:LU/b$a;

.field public static final d:LU/b;


# instance fields
.field private final a:F

.field private final b:F


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, LU/b$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LU/b$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LU/b;->c:LU/b$a;

    .line 8
    .line 9
    new-instance v0, LU/b;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    const/4 v3, 0x3

    .line 13
    invoke-direct {v0, v2, v2, v3, v1}, LU/b;-><init>(FFILkotlin/jvm/internal/j;)V

    .line 14
    .line 15
    .line 16
    sput-object v0, LU/b;->d:LU/b;

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    const/4 v0, 0x3

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 1
    invoke-direct {p0, v2, v2, v0, v1}, LU/b;-><init>(FFILkotlin/jvm/internal/j;)V

    return-void
.end method

.method public constructor <init>(FF)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput p1, p0, LU/b;->a:F

    .line 4
    iput p2, p0, LU/b;->b:F

    return-void
.end method

.method public synthetic constructor <init>(FFILkotlin/jvm/internal/j;)V
    .locals 1

    and-int/lit8 p4, p3, 0x1

    const/4 v0, 0x0

    if-eqz p4, :cond_0

    move p1, v0

    :cond_0
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_1

    move p2, v0

    .line 5
    :cond_1
    invoke-direct {p0, p1, p2}, LU/b;-><init>(FF)V

    return-void
.end method


# virtual methods
.method public final a()F
    .locals 0

    .line 1
    iget p0, p0, LU/b;->a:F

    .line 2
    .line 3
    return p0
.end method

.method public final b()F
    .locals 0

    .line 1
    iget p0, p0, LU/b;->b:F

    .line 2
    .line 3
    return p0
.end method
