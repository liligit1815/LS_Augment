.class public final Lo0/B$a;
.super Ljava/lang/Object;
.source "SplitAttributes.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lo0/B;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field private a:Lo0/B$d;

.field private b:Lo0/B$c;

.field private c:Lo0/j;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lo0/B$d;->e:Lo0/B$d;

    .line 5
    .line 6
    iput-object v0, p0, Lo0/B$a;->a:Lo0/B$d;

    .line 7
    .line 8
    sget-object v0, Lo0/B$c;->d:Lo0/B$c;

    .line 9
    .line 10
    iput-object v0, p0, Lo0/B$a;->b:Lo0/B$c;

    .line 11
    .line 12
    sget-object v0, Lo0/j;->b:Lo0/j;

    .line 13
    .line 14
    iput-object v0, p0, Lo0/B$a;->c:Lo0/j;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final a()Lo0/B;
    .locals 3

    .line 1
    new-instance v0, Lo0/B;

    .line 2
    .line 3
    iget-object v1, p0, Lo0/B$a;->a:Lo0/B$d;

    .line 4
    .line 5
    iget-object v2, p0, Lo0/B$a;->b:Lo0/B$c;

    .line 6
    .line 7
    iget-object p0, p0, Lo0/B$a;->c:Lo0/j;

    .line 8
    .line 9
    invoke-direct {v0, v1, v2, p0}, Lo0/B;-><init>(Lo0/B$d;Lo0/B$c;Lo0/j;)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method

.method public final b(Lo0/j;)Lo0/B$a;
    .locals 1

    .line 1
    const-string v0, "background"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lo0/B$a;->c:Lo0/j;

    .line 7
    .line 8
    return-object p0
.end method

.method public final c(Lo0/B$c;)Lo0/B$a;
    .locals 1

    .line 1
    const-string v0, "layoutDirection"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lo0/B$a;->b:Lo0/B$c;

    .line 7
    .line 8
    return-object p0
.end method

.method public final d(Lo0/B$d;)Lo0/B$a;
    .locals 1

    .line 1
    const-string v0, "type"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Lo0/B$a;->a:Lo0/B$d;

    .line 7
    .line 8
    return-object p0
.end method
