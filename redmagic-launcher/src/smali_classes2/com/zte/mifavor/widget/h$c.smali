.class public Lcom/zte/mifavor/widget/h$c;
.super Ljava/lang/Object;
.source "G2ContinuousRoundedPath.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/mifavor/widget/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# static fields
.field public static final c:Lcom/zte/mifavor/widget/h$c;


# instance fields
.field public final a:D

.field public final b:D


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/zte/mifavor/widget/h$c;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {v0, v1, v2, v1, v2}, Lcom/zte/mifavor/widget/h$c;-><init>(DD)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/zte/mifavor/widget/h$c;->c:Lcom/zte/mifavor/widget/h$c;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(DD)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 5
    .line 6
    iput-wide p3, p0, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lcom/zte/mifavor/widget/h$c;)Lcom/zte/mifavor/widget/h$c;
    .locals 5

    .line 1
    new-instance v0, Lcom/zte/mifavor/widget/h$c;

    .line 2
    .line 3
    iget-wide v1, p0, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 4
    .line 5
    iget-wide v3, p1, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 6
    .line 7
    sub-double/2addr v1, v3

    .line 8
    iget-wide v3, p0, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 9
    .line 10
    iget-wide p0, p1, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 11
    .line 12
    sub-double/2addr v3, p0

    .line 13
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/zte/mifavor/widget/h$c;-><init>(DD)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public b(Lcom/zte/mifavor/widget/h$c;)Lcom/zte/mifavor/widget/h$c;
    .locals 5

    .line 1
    new-instance v0, Lcom/zte/mifavor/widget/h$c;

    .line 2
    .line 3
    iget-wide v1, p0, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 4
    .line 5
    iget-wide v3, p1, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 6
    .line 7
    add-double/2addr v1, v3

    .line 8
    iget-wide v3, p0, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 9
    .line 10
    iget-wide p0, p1, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 11
    .line 12
    add-double/2addr v3, p0

    .line 13
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/zte/mifavor/widget/h$c;-><init>(DD)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public c(D)Lcom/zte/mifavor/widget/h$c;
    .locals 5

    .line 1
    new-instance v0, Lcom/zte/mifavor/widget/h$c;

    .line 2
    .line 3
    iget-wide v1, p0, Lcom/zte/mifavor/widget/h$c;->a:D

    .line 4
    .line 5
    mul-double/2addr v1, p1

    .line 6
    iget-wide v3, p0, Lcom/zte/mifavor/widget/h$c;->b:D

    .line 7
    .line 8
    mul-double/2addr v3, p1

    .line 9
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/zte/mifavor/widget/h$c;-><init>(DD)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method
