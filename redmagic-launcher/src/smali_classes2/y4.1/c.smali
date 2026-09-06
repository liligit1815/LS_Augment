.class public abstract Ly4/c;
.super Ljava/lang/Object;
.source "Random.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ly4/c$a;
    }
.end annotation


# static fields
.field public static final g:Ly4/c$a;

.field private static final h:Ly4/c;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ly4/c$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ly4/c$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ly4/c;->g:Ly4/c$a;

    .line 8
    .line 9
    sget-object v0, Lo4/b;->a:Lo4/a;

    .line 10
    .line 11
    invoke-virtual {v0}, Lo4/a;->b()Ly4/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Ly4/c;->h:Ly4/c;

    .line 16
    .line 17
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

.method public static final synthetic a()Ly4/c;
    .locals 1

    .line 1
    sget-object v0, Ly4/c;->h:Ly4/c;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public abstract b()I
.end method

.method public abstract c(I)I
.end method
