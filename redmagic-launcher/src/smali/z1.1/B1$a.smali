.class Lz1/B1$a;
.super Ljava/lang/Object;
.source "LoaderMemoryLogger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lz1/B1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field protected final a:I

.field protected final b:Ljava/lang/String;

.field protected final c:Ljava/lang/String;

.field protected final d:Ljava/lang/Exception;


# direct methods
.method protected constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lz1/B1$a;->a:I

    .line 5
    .line 6
    iput-object p2, p0, Lz1/B1$a;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lz1/B1$a;->c:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Lz1/B1$a;->d:Ljava/lang/Exception;

    .line 11
    .line 12
    return-void
.end method
