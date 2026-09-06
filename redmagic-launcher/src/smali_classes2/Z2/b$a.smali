.class public final LZ2/b$a;
.super Ljava/lang/Object;
.source "BadgeState.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LZ2/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "LZ2/b$a;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private A:Ljava/lang/Integer;

.field private B:Ljava/lang/Integer;

.field private C:Ljava/lang/Integer;

.field private D:Ljava/lang/Integer;

.field private E:Ljava/lang/Integer;

.field private F:Ljava/lang/Integer;

.field private G:Ljava/lang/Integer;

.field private H:Ljava/lang/Integer;

.field private I:Ljava/lang/Integer;

.field private J:Ljava/lang/Boolean;

.field private g:I

.field private h:Ljava/lang/Integer;

.field private i:Ljava/lang/Integer;

.field private j:Ljava/lang/Integer;

.field private k:Ljava/lang/Integer;

.field private l:Ljava/lang/Integer;

.field private m:Ljava/lang/Integer;

.field private n:Ljava/lang/Integer;

.field private o:I

.field private p:Ljava/lang/String;

.field private q:I

.field private r:I

.field private s:I

.field private t:Ljava/util/Locale;

.field private u:Ljava/lang/CharSequence;

.field private v:Ljava/lang/CharSequence;

.field private w:I

.field private x:I

.field private y:Ljava/lang/Integer;

.field private z:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LZ2/b$a$a;

    .line 2
    .line 3
    invoke-direct {v0}, LZ2/b$a$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LZ2/b$a;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0xff

    .line 2
    iput v0, p0, LZ2/b$a;->o:I

    const/4 v0, -0x2

    .line 3
    iput v0, p0, LZ2/b$a;->q:I

    .line 4
    iput v0, p0, LZ2/b$a;->r:I

    .line 5
    iput v0, p0, LZ2/b$a;->s:I

    .line 6
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object v0, p0, LZ2/b$a;->z:Ljava/lang/Boolean;

    return-void
.end method

.method constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0xff

    .line 8
    iput v0, p0, LZ2/b$a;->o:I

    const/4 v0, -0x2

    .line 9
    iput v0, p0, LZ2/b$a;->q:I

    .line 10
    iput v0, p0, LZ2/b$a;->r:I

    .line 11
    iput v0, p0, LZ2/b$a;->s:I

    .line 12
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object v0, p0, LZ2/b$a;->z:Ljava/lang/Boolean;

    .line 13
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, LZ2/b$a;->g:I

    .line 14
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    iput-object v0, p0, LZ2/b$a;->h:Ljava/lang/Integer;

    .line 15
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    iput-object v0, p0, LZ2/b$a;->i:Ljava/lang/Integer;

    .line 16
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    iput-object v0, p0, LZ2/b$a;->j:Ljava/lang/Integer;

    .line 17
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    iput-object v0, p0, LZ2/b$a;->k:Ljava/lang/Integer;

    .line 18
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    iput-object v0, p0, LZ2/b$a;->l:Ljava/lang/Integer;

    .line 19
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    iput-object v0, p0, LZ2/b$a;->m:Ljava/lang/Integer;

    .line 20
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    iput-object v0, p0, LZ2/b$a;->n:Ljava/lang/Integer;

    .line 21
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, LZ2/b$a;->o:I

    .line 22
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, LZ2/b$a;->p:Ljava/lang/String;

    .line 23
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, LZ2/b$a;->q:I

    .line 24
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, LZ2/b$a;->r:I

    .line 25
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, LZ2/b$a;->s:I

    .line 26
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, LZ2/b$a;->u:Ljava/lang/CharSequence;

    .line 27
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, LZ2/b$a;->v:Ljava/lang/CharSequence;

    .line 28
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, LZ2/b$a;->w:I

    .line 29
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    iput-object v0, p0, LZ2/b$a;->y:Ljava/lang/Integer;

    .line 30
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    iput-object v0, p0, LZ2/b$a;->A:Ljava/lang/Integer;

    .line 31
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    iput-object v0, p0, LZ2/b$a;->B:Ljava/lang/Integer;

    .line 32
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    iput-object v0, p0, LZ2/b$a;->C:Ljava/lang/Integer;

    .line 33
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    iput-object v0, p0, LZ2/b$a;->D:Ljava/lang/Integer;

    .line 34
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    iput-object v0, p0, LZ2/b$a;->E:Ljava/lang/Integer;

    .line 35
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    iput-object v0, p0, LZ2/b$a;->F:Ljava/lang/Integer;

    .line 36
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    iput-object v0, p0, LZ2/b$a;->I:Ljava/lang/Integer;

    .line 37
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    iput-object v0, p0, LZ2/b$a;->G:Ljava/lang/Integer;

    .line 38
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    iput-object v0, p0, LZ2/b$a;->H:Ljava/lang/Integer;

    .line 39
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    iput-object v0, p0, LZ2/b$a;->z:Ljava/lang/Boolean;

    .line 40
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/util/Locale;

    iput-object v0, p0, LZ2/b$a;->t:Ljava/util/Locale;

    .line 41
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    iput-object p1, p0, LZ2/b$a;->J:Ljava/lang/Boolean;

    return-void
.end method

.method static synthetic A(LZ2/b$a;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b$a;->j:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic B(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iput-object p1, p0, LZ2/b$a;->j:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p1
.end method

.method static synthetic C(LZ2/b$a;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b$a;->i:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic D(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iput-object p1, p0, LZ2/b$a;->i:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p1
.end method

.method static synthetic E(LZ2/b$a;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b$a;->y:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic F(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iput-object p1, p0, LZ2/b$a;->y:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p1
.end method

.method static synthetic G(LZ2/b$a;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b$a;->A:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic H(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iput-object p1, p0, LZ2/b$a;->A:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p1
.end method

.method static synthetic I(LZ2/b$a;)I
    .locals 0

    .line 1
    iget p0, p0, LZ2/b$a;->q:I

    .line 2
    .line 3
    return p0
.end method

.method static synthetic J(LZ2/b$a;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b$a;->B:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic K(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iput-object p1, p0, LZ2/b$a;->B:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p1
.end method

.method static synthetic L(LZ2/b$a;I)I
    .locals 0

    .line 1
    iput p1, p0, LZ2/b$a;->q:I

    .line 2
    .line 3
    return p1
.end method

.method static synthetic M(LZ2/b$a;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b$a;->C:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic N(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iput-object p1, p0, LZ2/b$a;->C:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p1
.end method

.method static synthetic O(LZ2/b$a;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b$a;->D:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic P(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iput-object p1, p0, LZ2/b$a;->D:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p1
.end method

.method static synthetic Q(LZ2/b$a;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b$a;->E:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic R(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iput-object p1, p0, LZ2/b$a;->E:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p1
.end method

.method static synthetic S(LZ2/b$a;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b$a;->F:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic T(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iput-object p1, p0, LZ2/b$a;->F:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p1
.end method

.method static synthetic U(LZ2/b$a;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b$a;->I:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic V(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iput-object p1, p0, LZ2/b$a;->I:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p1
.end method

.method static synthetic W(LZ2/b$a;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b$a;->G:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic X(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iput-object p1, p0, LZ2/b$a;->G:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p1
.end method

.method static synthetic Y(LZ2/b$a;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b$a;->H:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic Z(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iput-object p1, p0, LZ2/b$a;->H:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p1
.end method

.method static synthetic a(LZ2/b$a;)I
    .locals 0

    .line 1
    iget p0, p0, LZ2/b$a;->g:I

    .line 2
    .line 3
    return p0
.end method

.method static synthetic a0(LZ2/b$a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b$a;->J:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic b(LZ2/b$a;I)I
    .locals 0

    .line 1
    iput p1, p0, LZ2/b$a;->g:I

    .line 2
    .line 3
    return p1
.end method

.method static synthetic b0(LZ2/b$a;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iput-object p1, p0, LZ2/b$a;->J:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p1
.end method

.method static synthetic c0(LZ2/b$a;)Ljava/util/Locale;
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b$a;->t:Ljava/util/Locale;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic d0(LZ2/b$a;Ljava/util/Locale;)Ljava/util/Locale;
    .locals 0

    .line 1
    iput-object p1, p0, LZ2/b$a;->t:Ljava/util/Locale;

    .line 2
    .line 3
    return-object p1
.end method

.method static synthetic e(LZ2/b$a;)I
    .locals 0

    .line 1
    iget p0, p0, LZ2/b$a;->o:I

    .line 2
    .line 3
    return p0
.end method

.method static synthetic e0(LZ2/b$a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b$a;->p:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic f0(LZ2/b$a;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iput-object p1, p0, LZ2/b$a;->p:Ljava/lang/String;

    .line 2
    .line 3
    return-object p1
.end method

.method static synthetic g(LZ2/b$a;)I
    .locals 0

    .line 1
    iget p0, p0, LZ2/b$a;->s:I

    .line 2
    .line 3
    return p0
.end method

.method static synthetic g0(LZ2/b$a;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b$a;->u:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic h(LZ2/b$a;I)I
    .locals 0

    .line 1
    iput p1, p0, LZ2/b$a;->s:I

    .line 2
    .line 3
    return p1
.end method

.method static synthetic h0(LZ2/b$a;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iput-object p1, p0, LZ2/b$a;->u:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p1
.end method

.method static synthetic i0(LZ2/b$a;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b$a;->v:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic j(LZ2/b$a;I)I
    .locals 0

    .line 1
    iput p1, p0, LZ2/b$a;->o:I

    .line 2
    .line 3
    return p1
.end method

.method static synthetic j0(LZ2/b$a;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iput-object p1, p0, LZ2/b$a;->v:Ljava/lang/CharSequence;

    .line 2
    .line 3
    return-object p1
.end method

.method static synthetic k0(LZ2/b$a;)I
    .locals 0

    .line 1
    iget p0, p0, LZ2/b$a;->w:I

    .line 2
    .line 3
    return p0
.end method

.method static synthetic l(LZ2/b$a;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b$a;->k:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic l0(LZ2/b$a;I)I
    .locals 0

    .line 1
    iput p1, p0, LZ2/b$a;->w:I

    .line 2
    .line 3
    return p1
.end method

.method static synthetic m0(LZ2/b$a;)I
    .locals 0

    .line 1
    iget p0, p0, LZ2/b$a;->x:I

    .line 2
    .line 3
    return p0
.end method

.method static synthetic n0(LZ2/b$a;I)I
    .locals 0

    .line 1
    iput p1, p0, LZ2/b$a;->x:I

    .line 2
    .line 3
    return p1
.end method

.method static synthetic o0(LZ2/b$a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b$a;->z:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic p0(LZ2/b$a;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iput-object p1, p0, LZ2/b$a;->z:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p1
.end method

.method static synthetic q(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iput-object p1, p0, LZ2/b$a;->k:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p1
.end method

.method static synthetic q0(LZ2/b$a;)I
    .locals 0

    .line 1
    iget p0, p0, LZ2/b$a;->r:I

    .line 2
    .line 3
    return p0
.end method

.method static synthetic r(LZ2/b$a;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b$a;->l:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic r0(LZ2/b$a;I)I
    .locals 0

    .line 1
    iput p1, p0, LZ2/b$a;->r:I

    .line 2
    .line 3
    return p1
.end method

.method static synthetic t(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iput-object p1, p0, LZ2/b$a;->l:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p1
.end method

.method static synthetic u(LZ2/b$a;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b$a;->m:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic v(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iput-object p1, p0, LZ2/b$a;->m:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p1
.end method

.method static synthetic w(LZ2/b$a;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b$a;->n:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic x(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iput-object p1, p0, LZ2/b$a;->n:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p1
.end method

.method static synthetic y(LZ2/b$a;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, LZ2/b$a;->h:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method static synthetic z(LZ2/b$a;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iput-object p1, p0, LZ2/b$a;->h:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p1
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    .line 1
    iget p2, p0, LZ2/b$a;->g:I

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, LZ2/b$a;->h:Ljava/lang/Integer;

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, LZ2/b$a;->i:Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 14
    .line 15
    .line 16
    iget-object p2, p0, LZ2/b$a;->j:Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 19
    .line 20
    .line 21
    iget-object p2, p0, LZ2/b$a;->k:Ljava/lang/Integer;

    .line 22
    .line 23
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, LZ2/b$a;->l:Ljava/lang/Integer;

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 29
    .line 30
    .line 31
    iget-object p2, p0, LZ2/b$a;->m:Ljava/lang/Integer;

    .line 32
    .line 33
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 34
    .line 35
    .line 36
    iget-object p2, p0, LZ2/b$a;->n:Ljava/lang/Integer;

    .line 37
    .line 38
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 39
    .line 40
    .line 41
    iget p2, p0, LZ2/b$a;->o:I

    .line 42
    .line 43
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 44
    .line 45
    .line 46
    iget-object p2, p0, LZ2/b$a;->p:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget p2, p0, LZ2/b$a;->q:I

    .line 52
    .line 53
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 54
    .line 55
    .line 56
    iget p2, p0, LZ2/b$a;->r:I

    .line 57
    .line 58
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 59
    .line 60
    .line 61
    iget p2, p0, LZ2/b$a;->s:I

    .line 62
    .line 63
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 64
    .line 65
    .line 66
    iget-object p2, p0, LZ2/b$a;->u:Ljava/lang/CharSequence;

    .line 67
    .line 68
    const/4 v0, 0x0

    .line 69
    if-eqz p2, :cond_0

    .line 70
    .line 71
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    goto :goto_0

    .line 76
    :cond_0
    move-object p2, v0

    .line 77
    :goto_0
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object p2, p0, LZ2/b$a;->v:Ljava/lang/CharSequence;

    .line 81
    .line 82
    if-eqz p2, :cond_1

    .line 83
    .line 84
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    :cond_1
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    iget p2, p0, LZ2/b$a;->w:I

    .line 92
    .line 93
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 94
    .line 95
    .line 96
    iget-object p2, p0, LZ2/b$a;->y:Ljava/lang/Integer;

    .line 97
    .line 98
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 99
    .line 100
    .line 101
    iget-object p2, p0, LZ2/b$a;->A:Ljava/lang/Integer;

    .line 102
    .line 103
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 104
    .line 105
    .line 106
    iget-object p2, p0, LZ2/b$a;->B:Ljava/lang/Integer;

    .line 107
    .line 108
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 109
    .line 110
    .line 111
    iget-object p2, p0, LZ2/b$a;->C:Ljava/lang/Integer;

    .line 112
    .line 113
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 114
    .line 115
    .line 116
    iget-object p2, p0, LZ2/b$a;->D:Ljava/lang/Integer;

    .line 117
    .line 118
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 119
    .line 120
    .line 121
    iget-object p2, p0, LZ2/b$a;->E:Ljava/lang/Integer;

    .line 122
    .line 123
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 124
    .line 125
    .line 126
    iget-object p2, p0, LZ2/b$a;->F:Ljava/lang/Integer;

    .line 127
    .line 128
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 129
    .line 130
    .line 131
    iget-object p2, p0, LZ2/b$a;->I:Ljava/lang/Integer;

    .line 132
    .line 133
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 134
    .line 135
    .line 136
    iget-object p2, p0, LZ2/b$a;->G:Ljava/lang/Integer;

    .line 137
    .line 138
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 139
    .line 140
    .line 141
    iget-object p2, p0, LZ2/b$a;->H:Ljava/lang/Integer;

    .line 142
    .line 143
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 144
    .line 145
    .line 146
    iget-object p2, p0, LZ2/b$a;->z:Ljava/lang/Boolean;

    .line 147
    .line 148
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 149
    .line 150
    .line 151
    iget-object p2, p0, LZ2/b$a;->t:Ljava/util/Locale;

    .line 152
    .line 153
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 154
    .line 155
    .line 156
    iget-object p0, p0, LZ2/b$a;->J:Ljava/lang/Boolean;

    .line 157
    .line 158
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 159
    .line 160
    .line 161
    return-void
.end method
