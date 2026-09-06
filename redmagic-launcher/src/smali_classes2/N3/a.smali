.class public final LN3/a;
.super Ljava/lang/Object;
.source "LogUtilsConfig.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LN3/a$a;,
        LN3/a$b;
    }
.end annotation


# static fields
.field public static final d:LN3/a$a;


# instance fields
.field private a:Z

.field private b:Z

.field private c:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LN3/a$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LN3/a$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LN3/a;->d:LN3/a$a;

    .line 8
    .line 9
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, LN3/a;->b:Z

    .line 3
    iput-boolean v0, p0, LN3/a;->c:Z

    return-void
.end method

.method public constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 4
    invoke-direct {p0}, LN3/a;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LN3/a;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public final b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LN3/a;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public final c()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LN3/a;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public final d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LN3/a;->a:Z

    .line 2
    .line 3
    return p0
.end method
