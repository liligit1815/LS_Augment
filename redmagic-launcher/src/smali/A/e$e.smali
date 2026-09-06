.class public final LA/e$e;
.super Ljava/lang/Object;
.source "FontResourcesParserCompat.java"

# interfaces
.implements LA/e$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LA/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "e"
.end annotation


# instance fields
.field private final a:LG/e;

.field private final b:LG/e;

.field private final c:I

.field private final d:I

.field private final e:Ljava/lang/String;


# direct methods
.method public constructor <init>(LG/e;LG/e;IILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LA/e$e;->a:LG/e;

    .line 5
    .line 6
    iput-object p2, p0, LA/e$e;->b:LG/e;

    .line 7
    .line 8
    iput p3, p0, LA/e$e;->d:I

    .line 9
    .line 10
    iput p4, p0, LA/e$e;->c:I

    .line 11
    .line 12
    iput-object p5, p0, LA/e$e;->e:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a()LG/e;
    .locals 0

    .line 1
    iget-object p0, p0, LA/e$e;->b:LG/e;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, LA/e$e;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public c()LG/e;
    .locals 0

    .line 1
    iget-object p0, p0, LA/e$e;->a:LG/e;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, LA/e$e;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, LA/e$e;->c:I

    .line 2
    .line 3
    return p0
.end method
