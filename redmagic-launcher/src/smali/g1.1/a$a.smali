.class final Lg1/a$a;
.super Ljava/lang/Object;
.source "DaggerLauncherAppComponent.java"

# interfaces
.implements Lg1/c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lg1/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "a"
.end annotation


# instance fields
.field private a:Landroid/content/Context;

.field private b:Ljava/lang/String;

.field private c:Ljava/lang/Boolean;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lg1/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lg1/a$a;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/String;)Lg1/d$a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lg1/a$a;->f(Ljava/lang/String;)Lg1/a$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic b(Z)Lg1/d$a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lg1/a$a;->g(Z)Lg1/a$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic build()Lg1/d;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lg1/a$a;->e()Lg1/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic c(Landroid/content/Context;)Lg1/d$a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lg1/a$a;->d(Landroid/content/Context;)Lg1/a$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Landroid/content/Context;)Lg1/a$a;
    .locals 0

    .line 1
    invoke-static {p1}, Lf4/e;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Landroid/content/Context;

    .line 6
    .line 7
    iput-object p1, p0, Lg1/a$a;->a:Landroid/content/Context;

    .line 8
    .line 9
    return-object p0
.end method

.method public e()Lg1/c;
    .locals 4

    .line 1
    iget-object v0, p0, Lg1/a$a;->a:Landroid/content/Context;

    .line 2
    .line 3
    const-class v1, Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {v0, v1}, Lf4/e;->a(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lg1/a$a;->c:Ljava/lang/Boolean;

    .line 9
    .line 10
    const-class v1, Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-static {v0, v1}, Lf4/e;->a(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 13
    .line 14
    .line 15
    new-instance v0, Lg1/a$b;

    .line 16
    .line 17
    iget-object v1, p0, Lg1/a$a;->a:Landroid/content/Context;

    .line 18
    .line 19
    iget-object v2, p0, Lg1/a$a;->b:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p0, p0, Lg1/a$a;->c:Ljava/lang/Boolean;

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    invoke-direct {v0, v1, v2, p0, v3}, Lg1/a$b;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Boolean;Lg1/b;)V

    .line 25
    .line 26
    .line 27
    return-object v0
.end method

.method public f(Ljava/lang/String;)Lg1/a$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lg1/a$a;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Z)Lg1/a$a;
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lf4/e;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ljava/lang/Boolean;

    .line 10
    .line 11
    iput-object p1, p0, Lg1/a$a;->c:Ljava/lang/Boolean;

    .line 12
    .line 13
    return-object p0
.end method
